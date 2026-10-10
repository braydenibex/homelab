# Samba File Sharing

## Goal

Provide authenticated access to the media folders from Windows on the local network.

## Current configuration

- Container: CT 102, hostname `samba`, Debian 12
- Share name: `Media`
- Share path inside the container: `/media`
- Account: `mediauser`
- Guest access: disabled
- Read-only: disabled for this share
- Forced file user: `mediauser`

The Windows PC successfully opened `\\192.168.86.48\Media` and displayed the `movies` and `tv` folders. A complete write test still needs confirmation.

## Verification checklist

1. Run `testparm -s` in the Samba container after configuration changes.
2. Check service status with `systemctl status smbd`.
3. Connect from Windows using the Samba username and password.
4. Copy a small test file into the share and confirm it appears in the expected host directory.
5. Remove the test file after verifying access.

Do not commit Samba passwords or other credentials to this repository.
