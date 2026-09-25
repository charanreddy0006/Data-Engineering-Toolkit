# 17. Kappa Architecture

Kappa-style architecture emphasizes a streaming path and replayable event log.

```text
Events
  ↓
Stream Processor
  ↓
Serving
```

Historical recomputation can use retained events.

## Benefits
- one main processing model
- simpler logic than dual-path designs in some systems

## Challenges
- event retention
- replay cost
- state recovery
- suitability for non-event workloads

## Automobile
Retained telemetry can be replayed after a transformation change to rebuild historical vehicle-health results.
