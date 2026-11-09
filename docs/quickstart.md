# Quick start

Install Arkel, run a node, and put/get your first object.

## Install

```sh
curl -fsSL https://arkeldata.com/install.sh | sh
arkel --help
```

> Your identity is auto-created on first use and stored on disk. Run
> `arkel identity` to see your identity, and see [Identity](/identity) to back
> it up.

## Build from source

```sh
git clone https://github.com/amr8t/arkel && cd arkel
cargo build
./target/debug/arkel --help
```

## As an operator — run a storage node

<!--@include: ./snippets/storage-node.md-->

> This command auto-generates a **storage-node** identity on first boot. Back it
> up and, to earn credits on your own identity, link it with `--earn-to` —
> see [Identity](/identity).

Run an **index node** (part of the Raft metadata quorum):

```sh
arkel index \
  --http-addr 0.0.0.0:8001 \
  --peer-addresses <pubkey@ip:port,...>
```

> Auto-generates an **index-node** identity on first boot; back it up — see
> [Identity](/identity).

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

> Uses your **client** identity, auto-created on first use and used to encrypt
> your objects. Back it up — see [Identity](/identity).

> **Note:** During beta test, limited quota is available. Reach out on the
> [Discord channel](https://discord.gg/48UAaYPJM) for more quota.

See the [CLI reference](/cli) for the full command surface.
