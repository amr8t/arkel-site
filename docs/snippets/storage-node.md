The easiest way is one command (swap in your public IP and the disk you're
committing):

```sh
docker run -d --name arkel-storage --restart unless-stopped --network host \
  -v arkel-data:/var/lib/arkel \
  ghcr.io/amr8t/arkel:latest storage \
  --addr 0.0.0.0:9001 \
  --advertise-addr <your-public-ip>:9001 \
  --index-addrs http://index.pc1.arkeldata.com:8001 \
  --data-dir /var/lib/arkel/storage-9001 \
  --capacity 50GB
```

Prefer Compose? Use the ready-made files in
[`examples/storage-node/`](https://github.com/amr8t/arkel/tree/master/examples/storage-node):
edit `arkel-node.toml`, then `docker compose up -d`.

- Identity is auto-generated on first boot into the `arkel-data` volume.
- Needs inbound **UDP 9001** reachable for direct connections; otherwise iroh
  falls back to a relay.
- `capacity` is the disk you commit; the index fills it and pays against stored bytes.

<details>
<summary>Binary / systemd alternative</summary>

```sh
arkel storage \
  --addr 0.0.0.0:9001 \
  --advertise-addr <your-public-ip>:9001 \
  --index-addrs http://index.pc1.arkeldata.com:8001 \
  --data-dir /var/lib/arkel/storage
```

</details>
