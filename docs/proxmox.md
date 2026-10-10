# Proxmox VE

## Host

- Node name: `proxmox`
- Version recorded during setup: Proxmox VE 9.2.20
- Web interface: `https://192.168.86.2:8006`
- Linux bridge: `vmbr0`

## Containers

| CT ID | Hostname | OS | Purpose |
|---|---|---|---|
| 101 | `jellyfin` | Debian 12 | Media streaming |
| 102 | `samba` | Debian 12 | SMB file sharing |

Both containers are unprivileged. The media directory is passed into them as `/media`; Jellyfin uses a read-only mount and Samba uses a read-write mount.

## Safe maintenance

- Back up container configuration before editing it.
- Use the Proxmox UI or CLI to shut down containers cleanly.
- Check storage and mount status before restarting services.
- Never paste passwords, tokens, or private keys into documentation.
