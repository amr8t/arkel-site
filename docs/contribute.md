# Contribute

There are two ways to take part in the network: run a node as an operator, or
buy credits as a user.

## 1. As an operator — run a storage node

Running a storage node contributes its disk to the network. It registers with
the index, stores encrypted shards for others, and a background GC loop frees
shards that are no longer referenced.

<!--@include: ./snippets/storage-node.md-->

> **Tip:** run your storage node and your client with the same `--data-dir` so
> both share one identity — the earned storage capacity is credited to that identity.

Erasure coding means the network survives node failures — your node just stores
encrypted shards, and no single node holds your data in the clear.

> Operators earn **1/3 of their contributed capacity** back as storage capacity, capped at **50 GB**.
>
> **Planned:** get paid in money for contributed capacity once payment rails are in.

## 2. As a user — buy credits

> **Planned:** buy credits for increasing usage limits.
