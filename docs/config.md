---
title: Configuration
---

# Configuration

`arkel index` and `arkel storage` can be started from a TOML file instead of
passing every flag:

```sh
arkel index   --config /etc/arkel/arkel-node.toml
arkel storage --config /etc/arkel/arkel-node.toml
```

`--config` and `--data-dir` are global flags. For every key the precedence is:

**command-line flag → config file → built-in default**

## `[index_nodes]`

| Key | Type | Flag | Notes |
| --- | --- | --- | --- |
| `http_addr` | string | `--http-addr` | Address the HTTP API binds to (default `127.0.0.1:8001`) |
| `data_dir` | string | `--data-dir` | Identities, Raft log, and SQLite state |
| `peers` | array of strings | `--peer-addresses` | Cluster members as `pubkey@ip:port`; self-entries are filtered at startup |

## `[storage]`

| Key | Type | Flag | Notes |
| --- | --- | --- | --- |
| `addr` | string | `--addr` | Address the iroh QUIC endpoint binds to (default `127.0.0.1:9001`) |
| `advertise_addr` | string | `--advertise-addr` | Address registered with the index (defaults to `addr`) |
| `data_dir` | string | `--data-dir` | Identity and blob store |
| `index_addrs` | array of strings | `--index-addrs` | Index HTTP URLs; the registrar discovers the current Raft leader among them |
| `capacity` | string | `--capacity` | Allocation committed to the network, e.g. `"1TB"` (default 1TB) |
| `gc_interval_secs` | integer | `--gc-interval-secs` | Seconds between garbage-collection scans |

## Example

```toml
# --- index node ---
[index_nodes]
http_addr = "0.0.0.0:8001"
data_dir = "/var/lib/arkel/index-8001"
# Every node lists the same cluster; self-entries are filtered at startup.
peers = [
  "peer1@10.0.0.11:8001",
  "peer2@10.0.0.12:8001",
  "peer3@10.0.0.13:8001",
]

# --- storage node ---
[storage]
addr = "0.0.0.0:9001"
advertise_addr = "<your-public-ip>:9001"
data_dir = "/var/lib/arkel/storage-9001"
index_addrs = [
  "http://index.pc1.arkeldata.com:8001",  # public index cluster
]
# gc_interval_secs = 3600
```

## Sizes

`capacity` accepts a suffix (`"1TB"`, `"500GB"`, `"1G"`) or a raw byte count
(`"1048576"`).

## Identity

A node's identity is an iroh keypair generated on first boot and persisted in
its `data_dir` (`identity.key`). The node's network address and Raft ID derive
from it, so keep it stable and back it up.

See the [CLI reference](/cli) for the full flag surface.
