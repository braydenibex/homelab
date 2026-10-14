# Pi-hole Network-Wide DNS Filtering

## Overview

Deployed Pi-hole in a Debian 12 LXC container on Proxmox to provide DNS-based ad and tracker blocking across the home network.

## Objectives

- Deploy Pi-hole in a lightweight Proxmox LXC.
- Configure the router to use Pi-hole for DNS resolution.
- Verify DNS forwarding and blocklist functionality.
- Test connectivity from multiple home devices.
- Document the configuration and troubleshooting process.

## Architecture

- **Virtualization:** Proxmox VE
- **Container:** Debian 12 LXC
- **Service:** Pi-hole
- **Pi-hole address:** `192.168.86.45`
- **Router address:** `192.168.86.1`
- **Upstream DNS:** Cloudflare (`1.1.1.1`)
- **Network:** `192.168.86.0/24`

## Implementation

1. Created a Debian 12 LXC container in Proxmox.
2. Installed and configured Pi-hole.
3. Configured custom DNS on the router.
4. Reserved the Pi-hole IP address.
5. Verified DNS resolution and blocklist responses.
6. Tested browsing from multiple home devices.

## Validation

The following tests succeeded:

- DNS resolution through Pi-hole.
- `doubleclick.net` returned `0.0.0.0` in a DNS lookup.
- Pi-hole logs showed DNS queries forwarded to Cloudflare.
- The dashboard showed DNS requests and blocked queries.
- Web browsing worked on multiple home devices.

## Limitations

DNS-based filtering cannot reliably block every advertisement. YouTube and Twitch in-stream ads may still appear.

Some devices may use VPNs or encrypted DNS services that bypass network-level DNS filtering.

## Performance

Pi-hole handles DNS queries rather than routing normal internet traffic. For a typical home network, its performance overhead is low.

## Future Improvements

- Add sanitized screenshots of the dashboard.
- Monitor container CPU and memory usage.
- Improve per-device query visibility.
- Document backup and recovery procedures.

## Security Notes

No credentials, tokens, or public access to the Pi-hole admin interface should be included in this repository.
