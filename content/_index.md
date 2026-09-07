+++
title = "Arkel"
+++

# Arkel

Arkel aims to be a community driven alternative to Cloud providers. Node operators contribute storage in exchange for credit and users can pay to use object storage.

Why use Arkel when alternatives like S3, R2, B2 exist? We think there are many reasons:

- Cloud providers are geared towards enterprises as that's where most of the profit is.
- These result in features and incentives that benefit from massive expansion, owning the entire stack, etc.
- Arkel is a fresh take at the same problem, initially geared to supplement self hosting usecases.

Examples of where Arkel would shine:

- Easy remote backups for your self hosting servers.
- Media offload service, think Immich, Mastodon media, Forum attachments etc
- Avoid Vendor Dependence, Not just major outages, but suprise/hidden charges, unethical practices etc
- A Second life of old storage hardware that's not being used
- Community and friends, help each other out.

Currently the project is in early Alpha with contribution and usage possible. Checkout the See [Roadmap](/roadmap/).

## Get started

### As an operator

Run a **storage node** to contribute disk, get quota:

```sh
arkel storage \
  --addr 0.0.0.0:9001 \
  --index-addrs http://index.example:8001 \
  --data-dir /var/lib/arkel/storage
```

Run an **index node** (part of the Raft quorum):

```sh
arkel index \
  --http-addr 0.0.0.0:8001 \
  --peer-addresses <pubkey@ip:port,...>
```

### As a user

```sh
# put
arkel client put photo.jpg --bucket media --key holidays/1.jpg

# get
arkel client get media holidays/1.jpg --output photo.jpg

# rm
arkel client rm media holidays/1.jpg
```

See the [CLI reference](/cli/) for the full command surface.

Want to earn storage quota in exchange for contributing disk?
See [Contribute](/contribute/).
