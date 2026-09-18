# Contribute

There are two ways to take part in the network: run a node as an operator, or
buy credits as a user.

## 1. As an operator — run a storage node

Running a storage node contributes its disk to the network. It registers with
the index, stores encrypted shards for others, and a background GC loop frees
shards that are no longer referenced.

<!--@include: ./snippets/storage-node.md-->

Erasure coding means the network survives node failures — your node just stores
encrypted shards, and no single node holds your data in the clear.

> **Planned:** get credited for contributing storage to the network.

## 2. As a user — buy credits

> **Planned:** buy credits for increasing usage limits.
