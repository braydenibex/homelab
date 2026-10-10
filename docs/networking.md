# Networking

## Current local addresses

These are the addresses observed during setup and may change if DHCP leases change.

| System | Address | Service |
|---|---|---|
| Proxmox host | `192.168.86.2` | Web interface on port `8006` |
| Jellyfin CT 101 | `192.168.86.50` | Web interface on port `8096` |
| Samba CT 102 | `192.168.86.48` | SMB file sharing |

## Access

- Proxmox: `https://192.168.86.2:8006`
- Jellyfin: `http://192.168.86.50:8096`
- Samba share from Windows: `\\192.168.86.48\Media`

Use these addresses only on the trusted local network. Do not expose Proxmox administration or SMB directly to the public internet. Consider DHCP reservations if stable addresses are needed.
