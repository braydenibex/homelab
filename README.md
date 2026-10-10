# Proxmox Homelab

Documentation for my personal homelab built around Proxmox VE, with separate containers for Jellyfin media streaming and Samba file sharing.

> This repository documents a work in progress. Commands, IP addresses, and configuration details should be reviewed against the current system before reuse.

## Goals

- Learn virtualization and Linux system administration with Proxmox VE.
- Provide a media library through Jellyfin.
- Share files on the local network using Samba.
- Document storage, networking, security, troubleshooting, and future improvements.
- Keep a clear record of changes so the setup can be rebuilt and maintained.

## Current Architecture

| Component | Details |
|---|---|
| Hypervisor | Proxmox VE 9.2.20 |
| Proxmox node | `proxmox` |
| Jellyfin container | CT 101, Debian 12 |
| Samba container | CT 102, Debian 12 |
| Media storage | External Seagate One Touch HDD, approximately 4.5 TB, exFAT |
| Media directories | `media/movies` and `media/tv` |
| Network | Local LAN using Proxmox bridge `vmbr0` |

### Services

- **Jellyfin:** Media server running in an unprivileged LXC container. The media directory is passed through read-only to help prevent accidental changes from the streaming service.
- **Samba:** File sharing in a separate unprivileged LXC container. The `Media` share is intended for authenticated access on the local network.
- **External storage:** Mounted on the Proxmox host and passed into the service containers. The drive contains existing files, so it must not be formatted as part of routine setup.

## Repository Layout

```text
homelab/
├── README.md
├── CHANGELOG.md
├── docs/
│   ├── architecture.md
│   ├── hardware.md
│   ├── networking.md
│   ├── storage.md
│   ├── proxmox.md
│   ├── samba.md
│   ├── jellyfin.md
│   ├── security.md
│   └── troubleshooting.md
├── diagrams/
│   └── network-topology.mmd
└── screenshots/
    └── README.md
```

## Setup Guides

- [Architecture](docs/architecture.md)
- [Hardware](docs/hardware.md)
- [Networking](docs/networking.md)
- [Storage](docs/storage.md)
- [Proxmox](docs/proxmox.md)
- [Samba](docs/samba.md)
- [Jellyfin](docs/jellyfin.md)
- [Security](docs/security.md)
- [Troubleshooting](docs/troubleshooting.md)

## Progress

- [x] Install Proxmox VE
- [x] Create the Jellyfin LXC container
- [x] Create the Samba LXC container
- [x] Install Jellyfin and Samba
- [x] Configure the media directory mounts
- [x] Open the Samba share from a Windows PC
- [ ] Verify copying, editing, and deleting a test file through Samba
- [ ] Add a media library in Jellyfin and test playback
- [ ] Complete setup and troubleshooting documentation
- [ ] Add sanitized screenshots and a network diagram

## Security and Privacy

- Never commit passwords, API keys, private keys, tokens, or credentials.
- Review screenshots for public IP addresses, serial numbers, account names, and other information you do not want public.
- Local IP addresses in this documentation are examples from the current setup and may change with DHCP.
- Do not publish complete configuration files until they have been checked for secrets and unnecessary personal information.
- Do not format or repartition the existing external media drive as part of these instructions.

## Change Log

See [CHANGELOG.md](CHANGELOG.md) for notable setup changes.

---

This is a learning project. I will update the documentation as configurations are tested and the homelab evolves.
