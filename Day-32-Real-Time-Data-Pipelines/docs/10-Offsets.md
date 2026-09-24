# 10. Offsets

An offset identifies a consumer's position in a partition.

## Concept
```text
Partition:
0 1 2 3 4 5 6 7
        ↑
   consumer progress
```

## Why
Offsets enable:
- resume
- replay
- lag measurement
- recovery

## Best practice
Commit progress according to processing and sink semantics. Committing too early can create loss risk; committing too late can increase duplicate processing after restart.

## Automobile
Track offsets per consumer group for telemetry and fault streams.
