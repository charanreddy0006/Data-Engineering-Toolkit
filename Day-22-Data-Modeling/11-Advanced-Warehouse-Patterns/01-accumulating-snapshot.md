# Accumulating Snapshot

An accumulating snapshot represents a process progressing through milestones.

Automobile service:

```text
opened
  ↓
diagnosed
  ↓
approved
  ↓
repair_started
  ↓
repair_completed
  ↓
closed
```

One row can contain:

```text
service_order_id
opened_at
diagnosed_at
approved_at
repair_started_at
repair_completed_at
closed_at
```

## Metrics

```text
diagnosis_wait
repair_duration
total_cycle_time
```

## Why?

Users often want the lifecycle of one process in one row.

## Quality

Milestones should be chronological where business rules require it.

A reopened order needs explicit semantics; do not silently overwrite the original lifecycle.
