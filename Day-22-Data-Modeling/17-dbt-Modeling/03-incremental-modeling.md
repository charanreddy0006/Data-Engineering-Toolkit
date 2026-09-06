# Incremental Modeling

Incremental models process only new or changed data.

Useful for huge telemetry facts.

```text
Raw events
   ↓
identify new/changed records
   ↓
transform
   ↓
append/merge
```

## Design questions

- What is the incremental key?
- Can records arrive late?
- Can existing records be corrected?
- How far back should the process look?
- How are duplicates handled?
- Can a full rebuild be performed?

## Automobile example

Useful fields:

```text
event_id
event_time
ingestion_time
```

A lookback window can capture late events.

## Recovery

Every incremental model needs a safe full-refresh/rebuild strategy.

A model that cannot be reconstructed is difficult to operate safely.
