# Hardware Inventory

Record exact specifications from the running system or device labels. Do not guess at missing values.

## Proxmox Host

| Component | Details |
|---|---|
| Device / model | To be verified |
| CPU | To be verified |
| Memory | To be verified |
| Boot drive | To be verified |
| Network interface | To be verified |
| Proxmox version | Setup notes say 9.2.20; verify on host |

## Storage

| Device | Capacity | Filesystem / role |
|---|---:|---|
| External Seagate One Touch HDD | Reported approximately 4.5 TB | exFAT media storage |

## Commands to Run When Home

Run these read-only inventory commands on the Proxmox host:

```bash
hostnamectl
lscpu
free -h
lsblk -o NAME,SIZE,MODEL,FSTYPE,MOUNTPOINTS
ip -br link
pveversion -v
```

Review output before committing. Remove serial numbers, unique identifiers, public addresses, and other information you do not want public.

## Notes

- Do not disconnect or reformat the media drive while containers are using it.
- Confirm the exact model and capacity directly on the host.
