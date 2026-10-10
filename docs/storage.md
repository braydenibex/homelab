# Storage

## Current arrangement

- Proxmox host mount: `/mnt/external-hdd`
- Device partition observed during setup: `/dev/sdb2`
- Filesystem: exFAT
- Volume label: `One Touch`
- Media directory: `/mnt/external-hdd/media`
- Media subdirectories: `movies` and `tv`

The partition UUID recorded during setup is `2A09-412F`. Confirm it on the host before relying on it in any command.

## Mount configuration

The intended persistent mount entry in `/etc/fstab` is:

```fstab
UUID=2A09-412F /mnt/external-hdd exfat defaults,nofail,x-systemd.device-timeout=10,uid=101000,gid=101000,fmask=0117,dmask=0007 0 0
```

This entry reflects the current setup notes; verify ownership and permission behavior before changing it. A successful `findmnt --verify --verbose` check was observed during setup.

## Safety checklist

1. Identify the drive using `lsblk -f` and `blkid`.
2. Check mount status with `findmnt /mnt/external-hdd`.
3. Never assume `/dev/sdb` will always identify the same device.
4. Do not format or repartition the external drive.
5. Keep a separate backup of irreplaceable files; a single external drive is not a backup.
