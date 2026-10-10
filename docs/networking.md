# Networking

## Current Design

The Proxmox host uses the Linux bridge `vmbr0` to connect the host and guest networking. The home router may provide LAN gateway and DHCP services; verify the actual configuration.

| Component | Network role |
|---|---|
| Home router | LAN gateway / DHCP (verify) |
| Proxmox bridge `vmbr0` | Connects host and guest networking |
| CT 101 — Jellyfin | Media streaming |
| CT 102 — Samba | Authenticated file sharing |

## Address Inventory

Fill these in after verifying them in the Proxmox UI or with `ip -br address` on the host and inside each container.

| Device | Address | Assignment |
|---|---|---|
| Proxmox host | To verify | To verify |
| Jellyfin CT 101 | To verify | To verify |
| Samba CT 102 | To verify | To verify |

Do not publish your public IP address, router credentials, VPN configuration, or remote-access endpoints.

## Ports to Review

These are common defaults, not confirmation that a port is open in this environment.

| Service | Typical port | Intended access |
|---|---:|---|
| Proxmox web UI | TCP 8006 | Trusted administration devices only |
| SSH | TCP 22 | Administration only |
| Jellyfin HTTP | TCP 8096 | Local media clients |
| Samba | TCP 445 | Trusted local clients |

## Future Improvements

- [ ] Record verified IP assignments and DHCP/static configuration.
- [ ] Document firewall rules.
- [ ] Consider a separate VLAN for servers and lab systems.
- [ ] Restrict administrative interfaces to trusted devices.
- [ ] Document DNS and any future HTTPS configuration.
