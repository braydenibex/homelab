# Jellyfin

## Purpose

Jellyfin provides self-hosted media streaming for the local network.

## Deployment

| Property | Details |
|---|---|
| Platform | Proxmox VE |
| Guest | LXC CT 101 |
| OS | Debian 12 |
| Movies path | `/media/movies` |
| TV path | `/media/tv` |
| Default web port | TCP 8096; verify actual configuration |

## Storage Access

Media is supplied from the external disk mounted on the Proxmox host. The intended design is read-only access from Jellyfin to reduce accidental changes to the library.

## Validation Checklist

- [ ] Open the Jellyfin web interface from a trusted LAN device.
- [ ] Add Movies and TV libraries using the paths above.
- [ ] Confirm media is indexed correctly.
- [ ] Play a test file and verify playback.
- [ ] Confirm the container cannot write to the media mount.
- [ ] Test service availability after a container restart.
- [ ] Verify whether hardware transcoding is configured; do not assume it is enabled.

## Troubleshooting

Useful commands inside the container:

```bash
systemctl status jellyfin
journalctl -u jellyfin --since "30 minutes ago"
df -h
```

Redact account names, private paths, and other sensitive details from logs before publishing.
