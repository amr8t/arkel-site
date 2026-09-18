# Quick start

Install Arkel, run a node, and put/get your first object.

## Install

```sh
curl -fsSL https://arkeldata.com/install.sh | sh
arkel --help
```

## Build from source

```sh
git clone https://github.com/amr8t/arkel && cd arkel
cargo build
./target/debug/arkel --help
```

## As an operator

Run a **storage node** to contribute disk and get quota:

```sh
arkel storage \
  --addr 0.0.0.0:9001 \
  --index-addrs http://index.example:8001 \
  --data-dir /var/lib/arkel/storage
```

- `--addr` — the QUIC endpoint to bind (default `127.0.0.1:9001`)
- `--index-addrs` — index node URLs to register against
- Identity is auto-generated on first boot into `--data-dir/identity.key`.

Run an **index node** (part of the Raft metadata quorum):

```sh
arkel index \
  --http-addr 0.0.0.0:8001 \
  --peer-addresses <pubkey@ip:port,...>
```

## As a user

```sh
# put
arkel client put photo.jpg --bucket media --key holidays/1.jpg

# get
arkel client get media holidays/1.jpg --output photo.jpg

# rm
arkel client rm media holidays/1.jpg
```


See the [CLI reference](/cli) for the full command surface.
