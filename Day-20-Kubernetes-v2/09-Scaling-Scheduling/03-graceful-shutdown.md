# Graceful Shutdown

Pods may terminate during:

- rolling deployments,
- scaling,
- node maintenance,
- rescheduling.

## Desired flow

```text
Termination signal
       ↓
Stop accepting new work
       ↓
Finish safe in-flight work
       ↓
Flush/commit state
       ↓
Close connections
       ↓
Exit
```

## Application responsibility

Services and workers should handle termination appropriately.

Streaming applications may need to:

- checkpoint,
- commit offsets safely,
- flush buffers.

ETL jobs may need to:

- complete or roll back transactions,
- clean staging data,
- prevent partial publication.

## Kubernetes setting

```yaml
terminationGracePeriodSeconds: 30
```

Choose the value based on actual shutdown behavior.

## Key principle

Kubernetes can request termination, but the application must be designed to shut down safely.
