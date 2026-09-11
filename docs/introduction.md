# Introduction

Arkel is a community-driven alternative to cloud object storage. Node operators
contribute storage in exchange for credit, and users pay to use object storage.

Why use Arkel when alternatives like S3, R2, or B2 exist? We think there are
several reasons:

- Cloud providers are geared towards enterprises, because that is where most of
  the profit is.
- That results in features and incentives that benefit from massive expansion
  and owning the entire stack.
- Arkel is a fresh take on the same problem, initially geared to supplement
  self-hosting use cases.

## Where Arkel shines

- Easy remote backups for your self-hosting servers.
- Media offload services — think Immich, Mastodon media, forum attachments.
- Avoiding vendor dependence: not just major outages, but surprise or hidden
  charges and unethical practices.
- A second life for old storage hardware that is not being used.
- Community and friends helping each other out.

## How it works

- **Client-side encryption** — objects are encrypted on your machine before
  upload (`chacha20poly1305`), so storage nodes only ever hold ciphertext.
- **Erasure coding** — the ciphertext is split into `k` data shards and `m`
  parity shards, spread across independent storage nodes. The network survives
  losing up to `m` nodes.
- **Distributed metadata** — a Raft cluster of index nodes owns the global
  catalog: buckets, objects, ownership, and quotas. No single company controls
  the index.
- **An economy** — accounts hold quota, storage operators earn contribution
  grants, and a payment operator credits accounts.

## Project status

The project is in early alpha, with contribution and usage possible. The main
instance of the network is scheduled to go live soon. See the
[roadmap](/roadmap) for where things are heading.

## Next steps

- [Quick start](/quickstart) — build, run a node, and store your first object.
- [Contribute](/contribute) — run a storage node and earn quota.
- [CLI reference](/cli) — the full command surface.
