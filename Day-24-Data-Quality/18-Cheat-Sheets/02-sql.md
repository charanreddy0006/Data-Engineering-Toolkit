# SQL Quality Cheat Sheet

```sql
-- NULL
WHERE column IS NULL

-- Duplicate
GROUP BY key
HAVING COUNT(*) > 1

-- Range
WHERE value < min OR value > max

-- Domain
WHERE status NOT IN ('ACTIVE', 'RETIRED')

-- Orphan
LEFT JOIN master
WHERE master.id IS NULL

-- Freshness
CURRENT_TIMESTAMP - MAX(updated_at)

-- Temporal
WHERE end_time < start_time

-- Coverage
COUNT(DISTINCT entity_id)

-- Reconciliation
source_total - target_total
```

Report both failed rows and failure rate.
