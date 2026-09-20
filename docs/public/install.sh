#!/bin/sh
# Install the latest Arkel release binary.
#
#   curl -fsSL https://arkeldata.com/install.sh | sh
#
set -eu

REPO="amr8t/arkel"
BIN="arkel"

os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(uname -m)

case "$os" in
  linux) ;;
  *) echo "$BIN: unsupported OS: $os (only linux builds are published)" >&2; exit 1 ;;
esac

case "$arch" in
  x86_64 | amd64) asset="$BIN-x86_64" ;;
  aarch64 | arm64) asset="$BIN-aarch64" ;;
  *) echo "$BIN: unsupported architecture: $arch (only x86_64 and aarch64 builds are published)" >&2; exit 1 ;;
esac

base="https://github.com/$REPO/releases/latest/download"

if [ -w /usr/local/bin ] 2>/dev/null; then
  dir="/usr/local/bin"
else
  dir="${ARKEL_INSTALL_DIR:-$HOME/.local/bin}"
fi
mkdir -p "$dir"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "Downloading $BIN ($asset)..."
curl -fsSL "$base/$asset" -o "$tmp/$asset"

if curl -fsSL "$base/$asset.sha256" -o "$tmp/$asset.sha256" 2>/dev/null; then
  ( cd "$tmp" && sha256sum -c "$asset.sha256" >/dev/null ) || {
    echo "$BIN: checksum verification failed" >&2
    exit 1
  }
fi

install -m 0755 "$tmp/$asset" "$dir/$BIN"
echo "Installed $BIN to $dir/$BIN"

case ":$PATH:" in
  *":$dir:"*) ;;
  *) echo "Add $dir to your PATH to run '$BIN'." ;;
esac
