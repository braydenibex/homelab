# Security Notes

- Use unique, strong passwords for Proxmox, Samba, and Jellyfin.
- Never store passwords, API tokens, private keys, recovery codes, or session cookies in Git.
- Keep Proxmox management and SMB access on a trusted network; do not port-forward them directly to the internet.
- Update the host and containers with a planned maintenance process.
- Use unprivileged LXC containers where appropriate and keep Jellyfin's media mount read-only.
- Review screenshots and logs before publishing; redact personal details and anything sensitive.
- Maintain backups of important data. RAID, snapshots, and a single external drive are not substitutes for an independent backup.
- Review all configuration files before committing them to a public repository.
