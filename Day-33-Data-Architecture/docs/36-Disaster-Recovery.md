# 36. Disaster Recovery

DR defines how systems recover after major failures.

## Terms
**RPO:** maximum acceptable data loss measured in time.

**RTO:** target recovery time.

## Techniques
- backups
- replicas
- multi-zone
- multi-region
- replayable event logs
- infrastructure as code

## Recovery
```text
Failover → Restore → Replay → Validate → Resume
```

Requirements should differ by workload. Critical fleet operations may need faster recovery than historical BI.
