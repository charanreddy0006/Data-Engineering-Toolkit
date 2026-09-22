# 15. Model Registry

A model registry manages model artifacts and lifecycle metadata.

## Lifecycle

```text
Development
 ↓
Candidate
 ↓
Validated
 ↓
Production
 ↓
Retired
```

## Record

- model version
- dataset version
- feature version
- code commit
- metrics
- owner
- approval
- deployment history

## Why?

The serving platform must know exactly which artifact is running.

## Example

```text
maintenance-risk-v12
status = production
features = vehicle-health-v4
```

Keep prior validated versions available for rollback.
