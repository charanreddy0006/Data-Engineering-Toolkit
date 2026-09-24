# 25. Backpressure

Backpressure occurs when downstream capacity is lower than input volume.

Example:
```text
Input = 100k events/s
Process = 70k events/s
Lag grows
```

## Causes
- expensive transforms
- slow sink
- insufficient compute
- hot partition
- network limitation

## Responses
- scale processing
- optimize transformations
- batch sink writes
- improve partition balance
- throttle producers when appropriate

## Automobile
Vehicles reconnecting after an outage can create a burst. The architecture should absorb or control the burst rather than letting lag grow without bound.
