# BI Testing

## Data Tests
- Not-null checks
- Uniqueness
- Referential integrity
- Accepted values
- Freshness

## Metric Tests
Reconcile:
```text
BI Revenue
vs
Finance Revenue
```

Investigate expected differences such as timing, tax, currency, returns or scope.

## Security Tests
Test:
- executive
- regional manager
- dealer manager

Each role should receive the intended row set.

## Regression Tests
When a model changes, verify critical KPIs before deployment.

## Automobile Example
After changing service joins, compare service revenue and order count before and after the change. A sudden increase in revenue with no business explanation can indicate duplicate rows.
