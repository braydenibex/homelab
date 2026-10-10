# Architecture

## Overview

The Proxmox host runs separate unprivileged LXC containers for Jellyfin and Samba. An external exFAT drive is mounted on the host, and its media directory is passed into each container.

- **CT 101 — Jellyfin:** media access is configured read-only.
- **CT 102 — Samba:** provides authenticated local-network file sharing.
- **Host storage mount:** `/mnt/external-hdd`.
- **Media path on host:** `/mnt/external-hdd/media`.
- **Media path inside containers:** `/media`.

## Data flow

1. The external drive is mounted by Proxmox.
2. Proxmox bind-mounts the media directory into each container.
3. A Windows PC accesses the Samba share to manage files.
4. Jellyfin reads the media files from its read-only mount.

## Design notes

Keeping file sharing and media streaming in separate containers helps separate service configuration and permissions. A read-only Jellyfin mount reduces the chance of accidental changes to the media library from that service.

Verify current container configuration before applying any changes. Do not format the existing external drive.
