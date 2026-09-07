+++
title = "Roadmap"
+++

Arkel is in active, early development. The main instance of the network is scheduled to go live soon.

## Now - A working core network

- Erasure-coded (k/m) object storage with client-side encryption
- Raft-based index cluster (membership, quotas, ownership)
- Storage nodes: registration/heartbeat, GC of unreferenced shards
- Integrity: health checks, shard audits, automatic repair & redistribution

## Next - An economy for contributors

- **Credits & quotas**: accounts buy credit to store; usage debits against it
- **Contribution grants**: storage operators earn credit for the bytes they host
- **Payouts**: settle node operators in USDC
- Operator dashboard — see your capacity, usage, and earnings

## Then - Drop-in compatibility

- **S3-compatible gateway**: use Arkel from existing tools (rclone, restic, the
  AWS SDK) instead of only the `arkel` CLI
- Replication/import tooling to migrate off a cloud provider

## Later - A community you can rely on

- Public node discovery & reputation (who is fast, reliable, well-connected)
- Node-vetted payout scaling and market-based pricing

This is a Rough order, the roadmap will be largely driven by what contributors actually need.
