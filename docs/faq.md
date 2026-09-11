# FAQ

## What is Arkel?

Arkel is a community powered object storage network. Node operators contribute disk and
will earn credit, users pay to store encrypted, erasure-coded blobs.

## How is my data secured?

Objects are encrypted on your machine with XChaCha20-Poly1305 before they are
erasure-coded, so storage nodes only ever hold ciphertext. The reconstructed object
is verified against a BLAKE3 object hash on download.

## What happens if a storage node goes offline?

Arkel and most object storage solutions use Erasure coding. This technique splits each object into 
`k` data shards and `m` parity shards
Reads need only `k` shards, so the object survives losing up to
`m` nodes.

## Do I need to run my own node to use Arkel?

No. Storage operators run nodes and earn credit. If you simply want to store and retrieve objects, users can pay for storage.
See [Contribute](/contribute) if you want to run a node.

## When can I get paid to run a node?
Soon, we are actively testing the network and welcome contributors. The contribution economy and payouts are being built.

## Is Arkel S3-compatible?

Not yet. An S3-compatible gateway is on the [roadmap](/roadmap) so regular tools like
rclone, restic, and any system using s3 compatible can talk to Arkel. Currenly you can use the 
[`arkel` CLI](/cli).

## Can storage operators read my files?

No. They hold only encrypted shards, and no single node holds enough shards to
reconstruct an object. Your master key never leaves your machine.

## What if I lose my key?

There is no server-side key escrow or recovery. If you lose your master key, the
data is unrecoverable. Treat key backup as essential.

## Is Arkel ready for production?

It is in early alpha and under active development. The core network works and
you can use it today. We recommend using Arkel as an additional layer of backup. Post Beta, we aim to be a complete replacement for your object storage needs.

