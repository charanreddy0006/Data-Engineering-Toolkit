# Data Quality Incident Response

```text
Detect
  |
Triage
  |
Contain
  |
Diagnose
  |
Recover
  |
Validate
  |
Communicate
  |
Prevent recurrence
```

## Triage

Ask:

1. What dataset?
2. Since when?
3. Which partitions?
4. Which rules?
5. How many rows?
6. Which consumers?
7. Is bad data already published?

## Containment

- stop publication
- quarantine affected partition
- route events to DLQ
- mark data product degraded

## Recovery

- replay source
- backfill
- rerun transformation
- repair data
- restore known-good snapshot

A successful pipeline run does not prove recovered data is correct; rerun quality checks after recovery.
