# Model Registry Specification

## Required Metadata

- model name
- model version
- feature version
- dataset version
- source code commit
- metrics
- owner
- approval state
- deployment history

## Lifecycle

```text
Candidate
   ↓
Validated
   ↓
Approved
   ↓
Production
   ↓
Retired
```

## Rollback
Keep the previous validated model available until the replacement is stable.
