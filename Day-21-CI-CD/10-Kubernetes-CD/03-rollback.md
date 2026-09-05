# Rollback

Kubernetes Deployment rollback:

```bash
kubectl rollout history deployment/telemetry-api
kubectl rollout undo deployment/telemetry-api
kubectl rollout status deployment/telemetry-api
```

## Critical data warning

```text
code rollback ≠ data rollback
```

A bad release may already have written data.

Data recovery may require:

- partition replay,
- staging cleanup,
- transaction recovery,
- deduplication,
- targeted backfill.

Plan application and data rollback separately.
