# Kubernetes Batch Workload Pattern

A robust data batch can be modeled as:

```text
Input partition
      ↓
Job
      ↓
Extract
      ↓
Transform
      ↓
Validate
      ↓
Publish
      ↓
Success
```

## Failure-aware design

If transformation succeeds but publishing fails:

```text
Do not mark partition complete.
```

Use a checkpoint/status table or another durable workflow state.

## Idempotent publish

Possible approach:

```text
staging partition
      ↓
validate
      ↓
atomic publish
```

The exact implementation depends on the target storage system.

## Kubernetes responsibility

Kubernetes should manage:

- Pod lifecycle,
- resources,
- scheduling,
- retries where configured.

The application/data system must manage:

- transaction semantics,
- correctness,
- data consistency,
- business-level retries.
