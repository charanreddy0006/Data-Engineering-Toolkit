# 25. Data Drift

Data drift means input data behavior changes over time.

Examples:
- feature distribution shifts
- category frequency changes
- missingness changes

## Investigation

```text
Drift Signal
 ↓
Check Source
 ↓
Check Pipeline
 ↓
Check Business Change
 ↓
Check Model Impact
```

## Important

A distribution change is not automatically a bug.

A new vehicle generation can legitimately change:
- battery capacity
- average trip distance
- sensor behavior

Monitor and investigate in context.
