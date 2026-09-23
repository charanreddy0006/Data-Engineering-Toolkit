# 11. Change Data Capture

CDC captures source inserts, updates and deletes.

```text
Operational DB
      ↓
Change Log
      ↓
CDC Consumer
      ↓
Batch Processing
```

## Why CDC?

It reduces the need to scan entire source tables.

## Batch integration

A CDC stream can accumulate changes that are consolidated by a scheduled batch.

## Challenges

- order
- duplicates
- deletes
- schema evolution
- checkpoints

CDC is a change-capture mechanism, not a full pipeline architecture by itself.
