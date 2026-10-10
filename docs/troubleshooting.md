# Troubleshooting Notes

## External drive is missing

1. Check devices with `lsblk -f`.
2. Check the expected mount with `findmnt /mnt/external-hdd`.
3. Confirm the UUID and filesystem before editing `/etc/fstab`.
4. Do not format the disk or guess which `/dev/sdX` device it is.

## Samba share will not open

1. Confirm CT 102 is running and has the expected IP.
2. Check `systemctl status smbd`.
3. Run `testparm -s` after configuration edits.
4. Confirm the share path exists and the account has access.
5. Verify Windows is connecting to the intended address and using the Samba account.

## Jellyfin cannot see media

1. Confirm CT 101 is running.
2. Confirm the host drive is mounted.
3. Verify the container's `/media` mount is present and read-only.
4. Check that media files exist under `/media/movies` or `/media/tv`.
5. Review Jellyfin logs and library settings.

When documenting a fix, include the observed symptom, diagnostic commands, root cause, solution, and verification result. Redact secrets from command output.
