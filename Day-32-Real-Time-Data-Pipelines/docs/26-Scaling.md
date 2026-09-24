# 26. Scaling

## Horizontal
Add more workers/consumers.

## Constraints
- partition count
- sink throughput
- state
- network
- hot keys

## Scaling process
```text
Measure bottleneck
 → Increase relevant capacity
 → Validate lag
 → Observe cost
```

## Automobile
Monitor event rate, consumer lag and sink throughput before simply adding compute.
