# Samba File Sharing

## Purpose

Samba provides authenticated file sharing to trusted devices on the local network.

## Deployment

| Property | Details |
|---|---|
| Platform | Proxmox VE |
| Guest | LXC CT 102 |
| OS | Debian 12 |
| Intended access | Local network only |
| Share name | `Media` (verify current configuration) |

## Validation Checklist

- [ ] Confirm the Samba service is running.
- [ ] Connect from a trusted client using an authorized account.
- [ ] Test reading an existing file.
- [ ] Create a harmless test file in a designated test directory.
- [ ] Verify write and delete permissions only where intended.
- [ ] Confirm a share intended to be read-only is not writable.

## Security Notes

- Avoid guest access unless there is a documented reason.
- Use strong, unique credentials.
- Do not expose SMB directly to the public internet.
- Never commit Samba passwords or unredacted configuration files.

## Troubleshooting

Useful commands inside the Samba container:

```bash
systemctl status smbd
testparm -s
journalctl -u smbd --since "30 minutes ago"
```

Review command output for usernames, share paths, and other details before publishing.
