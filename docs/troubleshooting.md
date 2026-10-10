# Troubleshooting Log

Record problems and the steps used to resolve them. Include only verified details and redact secrets from command output.

## Entry Template

### YYYY-MM-DD — Short problem title

**Symptoms**
- What failed and what error appeared?

**Environment**
- Host or container:
- Recent changes:

**Investigation**
1. Record non-destructive commands and observations.
2. Compare expected and actual behavior.
3. Identify the likely cause.

**Resolution**
- Document the change made.

**Verification**
- Explain how the fix was confirmed.

**Prevention / Lessons**
- Note any monitoring, backup, or documentation improvement.

## Safety Reminders

- Start with read-only inspection commands.
- Back up configuration before editing it.
- Avoid formatting, repartitioning, or destructive filesystem repair on the existing media disk.
- Never paste passwords, tokens, or unredacted logs into public issues or commits.
