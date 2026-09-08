# Data Quality Approach Comparison

| Approach | Strength | Best fit |
|---|---|---|
| SQL tests | Simple and transparent | Warehouses |
| Python | Flexible | Custom pipelines |
| dbt tests | ELT integration | Warehouse transformations |
| Great Expectations | Expectation framework | Multi-source validation |
| Spark | Distributed processing | Large datasets |
| Data contracts | Preventive control | Producer/consumer boundary |

Production platforms often combine several approaches.

```text
Contract
 + ingestion validation
 + distributed checks
 + dbt tests
 + observability
```

Choose the simplest approach that meets scale and operational requirements.
