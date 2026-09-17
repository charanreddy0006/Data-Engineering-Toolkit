# 26. BI Cheat Sheet

## Core
```text
BI = Data → Model → Metrics → Visualization → Decision
```

## Modeling
```text
Fact = Event + Measures
Dimension = Context
Grain = One row represents...
```

## Common KPIs
```text
Revenue = SUM(revenue)
Average Order Value = Revenue / Orders
Growth % = (Current - Previous) / Previous × 100
Claim Rate = Claims / Eligible Vehicles × 100
```

## Dashboard
```text
Context → KPI → Trend → Breakdown → Detail → Action
```

## Performance
```text
Model → SQL → Data Volume → Measures → Visuals
```

## Security
```text
Identity → Role → Dataset → Row Filter → Audit
```

## Refresh
```text
Full = simple but expensive
Incremental = scalable but needs change logic
```

## Golden Rules
1. Define grain.
2. Define KPI formulas.
3. Use star schemas.
4. Avoid double counting.
5. Govern semantic definitions.
6. Apply least privilege.
7. Monitor freshness.
8. Show last refresh time.
