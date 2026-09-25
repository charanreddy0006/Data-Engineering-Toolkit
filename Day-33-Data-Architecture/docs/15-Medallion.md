# 15. Medallion Architecture

A common organization pattern is:

```text
Bronze → Silver → Gold
```

### Bronze
Raw or lightly processed.

### Silver
Cleaned, deduplicated and standardized.

### Gold
Business-ready data products and aggregates.

## Automobile
```text
Bronze: raw telemetry
Silver: normalized events
Gold: vehicle health metrics
```

Medallion is a useful pattern, not a universal mandatory structure.
