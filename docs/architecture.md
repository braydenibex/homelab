# Homelab Architecture

## Overview

Proxmox VE is the virtualization layer. Services run in separate Debian LXC containers so they can be administered and troubleshot independently.

## Logical Architecture

```text
Home LAN
   |
Router / DHCP
   |
Proxmox host (vmbr0)
   |----------------------|
   |                      |
CT 101: Jellyfin       CT 102: Samba
   |                      |
Read-only media mount   Authenticated file share
   \                      /
    External media disk mounted on Proxmox host
```

See [the editable topology diagram](../diagrams/network-topology.mmd).

## Design Decisions

- **Separate services:** Jellyfin and Samba run in separate unprivileged LXC containers to reduce coupling.
- **Host-managed storage:** The external disk is mounted on the Proxmox host and exposed to containers through bind mounts.
- **Read-only media for Jellyfin:** Intended to reduce accidental changes to the media library.
- **Preserve existing data:** The external drive contains existing files. Do not format or repartition it as part of routine maintenance.

## Current Inventory

| Component | Role | Status |
|---|---|---|
| Proxmox VE node `proxmox` | Hypervisor | Installed; verify version |
| CT 101 — Debian 12 | Jellyfin media server | Installed; playback test pending |
| CT 102 — Debian 12 | Samba file sharing | Installed; file-operation test pending |
| External Seagate One Touch HDD | Media storage | Reported mounted on host; preserve existing data |

## Validation Checklist

- [ ] Confirm both containers start as intended after host reboot.
- [ ] Confirm each service remains reachable after restart.
- [ ] Confirm Jellyfin can read media but cannot modify the media mount.
- [ ] Confirm Samba authentication and permissions work as intended.
- [ ] Confirm the media disk is mounted before dependent containers start.
- [ ] Document and test backups.
