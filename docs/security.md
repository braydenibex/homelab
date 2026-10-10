# Security Baseline

This page describes the intended security posture. Mark a control as implemented only after verifying it on the running system.

## Administration

- [ ] Restrict Proxmox administration to trusted devices.
- [ ] Use unique credentials and multi-factor authentication where available.
- [ ] Use SSH keys where appropriate; disable password login only after verifying key-based access works.
- [ ] Keep Proxmox and guest operating systems updated.

## Network Exposure

- [ ] Keep Proxmox administration and Samba on the trusted LAN.
- [ ] Do not forward SMB (TCP 445) from the router to the internet.
- [ ] Only expose Jellyfin remotely if remote access is deliberately designed and secured.
- [ ] Review firewall rules and remove unused access.

## Storage

- [ ] Keep Jellyfin's media mount read-only.
- [ ] Test Samba permissions with a disposable file.
- [ ] Keep separate backups of important data.
- [ ] Confirm external storage is mounted before dependent containers start.

## Public Repository Hygiene

Before committing files or screenshots, check for passwords, API keys, tokens, private keys, session cookies, public IP addresses, remote-access endpoints, serial numbers, and account details.

## Recovery

Record what changed, the date, symptoms, fix, and verification for each meaningful incident. Never include secrets in incident notes.
