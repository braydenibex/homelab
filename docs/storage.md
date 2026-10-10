# Storage

## Current Media Disk

| Property | Details |
|---|---|
| Device | External Seagate One Touch HDD |
| Reported capacity | Approximately 4.5 TB |
| Filesystem | exFAT |
| Host mount location | Verify on the Proxmox host |
| Primary use | Media library for Jellyfin and file access through Samba |

**Important:** this drive contains existing data. Never format, repartition, or run destructive filesystem repair commands as part of routine setup.

## Intended Mount Design

The disk is mounted on the Proxmox host. Host directories are then bind-mounted into the relevant LXC containers.

Jellyfin paths recorded during setup:

- Movies: `/media/movies`
- TV: `/media/tv`

Verify the host mount point and each container's mount configuration before changing anything.

## Read-Only Verification Commands

Run on the Proxmox host:

```bash
lsblk -f
findmnt
df -hT
pct config 101
pct config 102
```

Review output for UUIDs and other identifiers before sharing it publicly.

## Permissions and Reliability

- Jellyfin should only need read access to the media library.
- Test Samba permissions with a disposable test file.
- Confirm the drive mounts automatically after reboot.
- Ensure dependent containers do not start against an empty mount-point directory if the external disk is missing.
- Maintain a separate backup of important data. A media disk is not itself a backup.
