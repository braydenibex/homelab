# Proxmox VE

## Role

Proxmox VE provides virtualization and container management for this homelab.

| Property | Value |
|---|---|
| Node name | `proxmox` (verify) |
| Version | Setup notes say 9.2.20 (verify) |
| Network bridge | `vmbr0` |
| Guests | CT 101 Jellyfin; CT 102 Samba |

## Useful Read-Only Commands

```bash
pveversion -v
pvesm status
ip -br address
lsblk -f
pct list
pct config 101
pct config 102
```

## Container Inventory

| CT ID | Operating system | Purpose |
|---:|---|---|
| 101 | Debian 12 | Jellyfin media streaming |
| 102 | Debian 12 | Samba file sharing |

## Operational Notes

- Back up container configuration and important data before significant changes.
- Track host updates separately from guest operating system updates.
- Avoid publishing unredacted configuration output, tokens, passwords, or private network details.
- Test recovery procedures rather than assuming a backup is usable.
