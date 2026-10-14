# Pi-hole Network Configuration

## Network Overview

Pi-hole provides DNS filtering for devices connected to the home network. The router forwards DNS requests to the Pi-hole LXC container.

## Network Details

| Component | Configuration |
|---|---|
| Proxmox guest | Debian 12 LXC |
| Pi-hole IP | `192.168.86.45` |
| Router IP | `192.168.86.1` |
| Subnet mask | `255.255.255.0` |
| Network range | `192.168.86.0/24` |
| Upstream DNS | Cloudflare (`1.1.1.1`) |
| Router DNS mode | Custom |
| IPv6 | Disabled on router |

## DNS Request Flow

1. A device requests a domain name.
2. The router forwards the DNS request to Pi-hole.
3. Pi-hole checks its cache and blocklists.
4. Blocked domains receive a blocking response.
5. Allowed requests are forwarded to Cloudflare when necessary.
6. Pi-hole returns the DNS response.

## IP Address Reservation

A DHCP reservation was configured for the Pi-hole container to help keep its address stable.

## Verification

- DNS requests appeared in Pi-hole logs.
- Requests were forwarded to Cloudflare.
- Blocked domains returned `0.0.0.0`.
- Browsing worked on multiple home devices.

## Notes

The router appears as the source for forwarded DNS requests. This means Pi-hole may not identify individual devices separately in its query log.
