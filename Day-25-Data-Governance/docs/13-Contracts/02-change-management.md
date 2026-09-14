# Data Change Management

## Purpose
Manage changes without surprising downstream consumers.

## Change Types

- additive non-breaking field
- type change
- rename
- removal
- semantic change
- quality/SLA change

## Safe Flow

```text
Propose -> Impact Analysis -> Consumer Review -> Approve
   -> Implement -> Validate -> Publish -> Monitor
```
