# Jellyfin

## Current setup

- Container: CT 101, hostname `jellyfin`
- OS: Debian 12, unprivileged LXC
- Web interface: `http://192.168.86.50:8096`
- Media path inside container: `/media`
- Media mount: configured read-only

The service was installed from the official Jellyfin repository after resolving a repository configuration conflict.

## Next steps

- Complete the first-run wizard if not already done.
- Add the Movies library pointing to `/media/movies`.
- Add the TV library pointing to `/media/tv`.
- Copy a test media file through Samba and confirm it appears in Jellyfin.
- Test playback and verify logs if playback fails.

Keep the Jellyfin media mount read-only unless there is a specific, understood reason to change it.
