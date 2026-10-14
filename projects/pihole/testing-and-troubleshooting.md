# Pi-hole Testing and Troubleshooting

## DNS Resolution Test

Command:

```bash
dig @127.0.0.1 doubleclick.net
```

Expected blocking response:

```text
doubleclick.net.  2  IN  A  0.0.0.0
```

Result: Passed. Pi-hole returned `0.0.0.0` for the tested domain.

## Blocklist Verification

Command:

```bash
pihole -q doubleclick.net
```

Result: The domain was found in the StevenBlack hosts blocklist.

## DNS Forwarding

Live DNS logs showed queries being forwarded to Cloudflare at `1.1.1.1`.

## Multi-Device Testing

Web browsing was tested successfully on multiple home devices while using the router's custom DNS configuration.

## iPhone Private Relay

Safari displayed a Private Relay compatibility prompt on the home Wi-Fi network. Selecting "Use Without Private Relay" restored browsing.

## IPv6

IPv6 was disabled in the router settings during troubleshooting. This configuration should be reviewed if IPv6 connectivity is needed in the future.

## Performance Considerations

Pi-hole handles DNS queries rather than forwarding regular web traffic. Its expected resource requirements are low for a typical home network.

## Known Limitations

- DNS filtering does not reliably block all YouTube or Twitch in-stream advertisements.
- Devices using VPNs or encrypted DNS may bypass network-level DNS filtering.
- The router appears as the source of forwarded DNS requests, limiting per-device visibility.

## Future Improvements

- Capture sanitized dashboard screenshots.
- Monitor LXC resource usage.
- Improve per-device query visibility.
- Document backup and recovery procedures.
