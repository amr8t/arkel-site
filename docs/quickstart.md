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

## As an operator — run a storage node

<!--@include: ./snippets/storage-node.md-->

Run an **index node** (part of the Raft metadata quorum):

```sh
arkel index \
  --http-addr 0.0.0.0:8001 \
  --peer-addresses <pubkey@ip:port,...>
```

## As a user

```sh
# The public index cluster
INDEX=http://index.pc1.arkeldata.com:8001

# put
arkel client put photo.jpg --bucket media --key holidays/1.jpg --index-addrs "$INDEX"

# get
arkel client get media holidays/1.jpg --output photo.jpg --index-addrs "$INDEX"

# rm
arkel client rm media holidays/1.jpg --index-addrs "$INDEX"
```


See the [CLI reference](/cli) for the full command surface.
