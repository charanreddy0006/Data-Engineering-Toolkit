# 23. Automobile BI Architecture

```text
                    ┌──────────────────┐
                    │ Vehicle Telemetry│
                    └────────┬─────────┘
                             │
 ┌────────────┐   ┌──────────▼─────────┐
 │ Dealers    │──▶│ Ingestion Platform │
 └────────────┘   └──────────┬─────────┘
 ┌────────────┐              │
 │ Service DB │──────────────┤
 └────────────┘              ▼
 ┌────────────┐       ┌───────────────┐
 │ Warranty   │──────▶│ Lake/Lakehouse│
 └────────────┘       └───────┬───────┘
                              ▼
                       ┌─────────────┐
                       │ Transform   │
                       │ SQL/dbt/Spark│
                       └──────┬──────┘
                              ▼
                       ┌─────────────┐
                       │ BI Warehouse│
                       └──────┬──────┘
                              ▼
                       ┌─────────────┐
                       │ Semantic    │
                       │ Model       │
                       └──────┬──────┘
                              ▼
                 ┌────────────────────────┐
                 │ Executive / Fleet /    │
                 │ Dealer / EV Dashboards │
                 └────────────────────────┘
```

## Production Principles
- Separate ingestion from serving.
- Use contracts for critical sources.
- Partition large event data.
- Maintain historical dimensions.
- Govern sensitive data.
- Monitor freshness.
- Version BI definitions.
- Test KPI calculations.
