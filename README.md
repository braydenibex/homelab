# Proxmox Homelab

A hands-on homelab project for learning Linux administration, virtualization, networking, storage, self-hosting, and security.

> This repository documents a work in progress. Configuration details should be verified against the live system before being reused.

## Architecture at a Glance

This lab uses Proxmox VE to run separate Linux containers for media streaming and file sharing.

```text
Home LAN
   |
Router / DHCP
   |
Proxmox VE host (bridge: vmbr0)
   |--------------------------|
   |                          |
CT 101: Jellyfin           CT 102: Samba
Debian 12                  Debian 12
   |                          |
Read-only media access     Authenticated file share
   \                          /
    External media disk mounted on Proxmox host
```

Editable diagram source: [diagrams/network-topology.mmd](diagrams/network-topology.mmd)

## Current Inventory

| Component | Details |
|---|---|
| Hypervisor | Proxmox VE (version recorded during setup: 9.2.20; verify on host) |
| Proxmox node | `proxmox` (verify) |
| Jellyfin container | CT 101, Debian 12 |
| Samba container | CT 102, Debian 12 |
| Media storage | External Seagate One Touch HDD, reported as approximately 4.5 TB, exFAT |
| Jellyfin media paths | `/media/movies` and `/media/tv` |
| Network bridge | `vmbr0` |

These details reflect the setup notes available when this repository was prepared. Verify them against the running host before relying on them.

## Documentation

- [Architecture](docs/architecture.md)
- [Hardware inventory](docs/hardware.md)
- [Networking](docs/networking.md)
- [Storage](docs/storage.md)
- [Proxmox VE](docs/proxmox.md)
- [Jellyfin](docs/jellyfin.md)
- [Samba](docs/samba.md)
- [Security baseline](docs/security.md)
- [Troubleshooting log](docs/troubleshooting.md)
- [Screenshots guidance](screenshots/README.md)
- [Changelog](CHANGELOG.md)

## Progress Checklist

- [x] Install Proxmox VE
- [x] Create Jellyfin LXC container
- [x] Create Samba LXC container
- [x] Install Jellyfin and Samba
- [x] Configure media directory mounts
- [x] Open the Samba share from a Windows client
- [ ] Verify Samba read/write permissions using a disposable test file
- [ ] Verify Jellyfin library indexing and playback
- [ ] Verify storage mounts after reboot
- [ ] Document exact hardware and verified network settings
- [ ] Document backup and restore procedure
- [ ] Add sanitized screenshots

## Security and Privacy

- Never commit passwords, API keys, tokens, private keys, session cookies, or recovery codes.
- Do not publish public IP addresses, remote-access endpoints, serial numbers, or account details unless you have a specific reason.
- Review screenshots and command output before committing.
- Keep Proxmox administration and SMB file sharing restricted to trusted devices.
- Do not format or repartition the existing external media drive as part of routine setup.
- The IP addresses and ports in the documentation are examples or values to verify, not a claim that services are exposed.

## Project Philosophy

Learn by building, testing, documenting what actually works, and recording mistakes and fixes. This is a learning lab; features should be marked complete only after they have been tested.
