# Automobile Quality Runbook

## Telemetry quality failure

### 1. Scope
Identify date/hour, producer, affected vehicles, and rule IDs.

### 2. Source
Compare source volume with raw landing volume.

### 3. Schema
Check field names, types, units, versions, and producer releases.

### 4. Contain
For critical failures, quarantine the affected partition and stop downstream publication if required.

### 5. Recover
Fix source/contract issue, replay or backfill, rerun validation, reconcile counts and aggregates.

### 6. Close
Record root cause, impact, remediation, prevention, and owner.

## Useful query

```sql
SELECT rule_id, failed_rows, pass_rate, status
FROM quality_result
ORDER BY checked_at DESC;
```
