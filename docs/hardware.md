# Hardware

## Known hardware

- Proxmox host with an internal SSD used for the Proxmox system and local LVM storage.
- External Seagate One Touch USB hard drive, approximately 4.5 TB, formatted as exFAT.
- Local network connection through Proxmox bridge `vmbr0`.

Exact host model, CPU, memory, and network hardware should be added after confirming them on the system.

## Storage safety

The external drive contains existing files. Never initialize, format, or repartition it as part of routine troubleshooting. Confirm device identity and mount points before running storage commands.
