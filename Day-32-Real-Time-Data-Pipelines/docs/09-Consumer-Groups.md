# 9. Consumer Groups

A consumer group shares work across consumer instances.

```text
Topic → Partition 0 → Consumer A
      → Partition 1 → Consumer B
      → Partition 2 → Consumer C
```

Different groups maintain independent progress.

## Scaling
A group cannot effectively use more parallel consumers than available partitions.

## Automobile
```text
vehicle.telemetry
 ├→ fleet-dashboard-group
 ├→ maintenance-ml-group
 └→ analytics-group
```
