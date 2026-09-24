# 24. Recovery

Streaming failures include process crashes, machine failures, broker outages and sink failures.

## Flow
```text
Detect → Restart/Failover → Restore State → Replay → Validate → Resume
```

## Replay
Replay requires the source to retain events long enough for recovery.

## Validate
Check lag, output freshness, duplicate rate and state consistency after recovery.
