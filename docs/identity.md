---
title: Identity
---

# Identity

Arkel uses iroh keypairs for identity. Every command auto-creates an identity on
first run and persists it as a 32-byte `identity.key` in that command's data
directory — there is no manual key-generation step.

## The four identities

| Identity | Created by | Default location (Linux) | Role |
| --- | --- | --- | --- |
| Client / user | `arkel client`, `arkel account` | `~/.local/share/arkel/client/identity.key` | Your account: quota, encryption, object ownership |
| Storage node | `arkel storage` | `~/.local/share/arkel/storage/identity.key` | Infrastructure: signs registration + GC, earns reputation |
| Payment operator | `arkel payment` | `~/.local/share/arkel/payment/identity.key` | Privileged: credits quota (one-time, first-wins) |
| Repair operator | `arkel repair` | `~/.local/share/arkel/repair/identity.key` | Privileged: heals under-replicated objects |

The **client identity is your encryption key** — objects are encrypted with it
before upload, so losing it means losing access to your data. The other three
identities only sign infrastructure/operator actions and do not hold your data
keys.

## See your identity

```sh
arkel identity
```

prints your identity (hex pubkey), the data directory, and the `identity.key`
path.

## Backing up

Back up `identity.key` — especially the client one — to a separate machine or
drive. On disk it is `0600` (owner-only).

## Linking a storage node to your account for credits

A storage node earns a **contribution grant** on its *own* identity by default
(the credited account is the node's pubkey). To earn on your **user** account
instead, pass that account's id:

```sh
arkel storage \
  --addr 0.0.0.0:9001 \
  --advertise-addr <your-public-ip>:9001 \
  --index-addrs http://index.pc1.arkeldata.com:8001 \
  --earn-to <your-user-hex-pubkey> \
  --capacity 50GB
```

Get `<your-user-hex-pubkey>` with `arkel identity`. This keeps the node's key
separate from your data key while crediting the right account.
