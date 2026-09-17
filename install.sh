#!/bin/sh
# Install the latest Arkel release binary.
#
#   curl -fsSL https://amr8t.github.io/arkel-site/install.sh | sh
#
set -eu

REPO="amr8t/arkelstore"
BIN="arkel"

os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(uname -m)

case "$os" in
  linux) ;;
  *) echo "$BIN: unsupported OS: $os (only linux builds are published)" >&2; exit 1 ;;
esac

case "$arch" in
  x86_64 | amd64) ;;
  *) echo "$BIN: unsupported architecture: $arch (only x86_64 builds are published)" >&2; exit 1 ;;
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

echo "Downloading $BIN..."
curl -fsSL "$base/$BIN" -o "$tmp/$BIN"

if curl -fsSL "$base/$BIN.sha256" -o "$tmp/$BIN.sha256" 2>/dev/null; then
  ( cd "$tmp" && sha256sum -c "$BIN.sha256" >/dev/null ) || {
    echo "$BIN: checksum verification failed" >&2
    exit 1
  }
fi

install -m 0755 "$tmp/$BIN" "$dir/$BIN"
echo "Installed $BIN to $dir/$BIN"

case ":$PATH:" in
  *":$dir:"*) ;;
  *) echo "Add $dir to your PATH to run '$BIN'." ;;
esac
