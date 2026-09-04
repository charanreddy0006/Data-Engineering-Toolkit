# Rollouts and Failure Semantics

## Rolling update

A Deployment can gradually replace old Pods with new Pods.

```text
A A A A
↓
A A A B
↓
A A B B
↓
A B B B
↓
B B B B
```

Readiness checks are important because a new Pod should not receive traffic before it is ready.

## Useful commands

```bash
kubectl rollout status deployment/api
kubectl rollout history deployment/api
kubectl rollout pause deployment/api
kubectl rollout resume deployment/api
kubectl rollout undo deployment/api
```

## Failure layers

```text
CronJob
  ↓
Job
  ↓
Pod
  ↓
Container
```

Each layer can have different failure/retry semantics.

## Data engineering danger

Suppose a batch writes:

```text
partition = 2026-09-03
```

and the process fails after partial completion.

A retry can duplicate data.

Use appropriate patterns:

- transactions,
- staging tables,
- upserts,
- unique constraints,
- atomic partition publishing,
- idempotency keys.

Kubernetes retries do not make the business operation idempotent.
