# Data Vault vs Dimensional

| Area | Data Vault | Dimensional |
|---|---|---|
| Integration | Strong | Moderate |
| Auditability | Strong | Depends on design |
| Historical capture | Strong | Strong with SCD |
| BI usability | Lower | High |
| Source change tolerance | Strong | Requires design |
| Typical role | Integration | Consumption |

A platform can use both:

```text
Sources
  ↓
Data Vault
  ↓
Dimensional marts
  ↓
BI
```

The choice should consider source complexity, audit requirements, team expertise, platform,
delivery time, and downstream usability.
