# Data Quality vs Data Observability

Data quality asks whether data meets expectations.

Data observability is broader: it helps explain the health and behavior of data systems.

## Quality signals

- null rate
- invalid rate
- duplicate rate
- referential failures

## Observability signals

- freshness
- volume
- schema changes
- lineage
- distribution drift
- pipeline health

```text
             Data Observability
      +-----------------------------+
      | Freshness | Volume | Schema |
      | Quality   | Lineage| Drift  |
      +-----------------------------+
                    |
                    v
             Consumer Trust
```

Example: all vehicle telemetry values can be valid, yet the latest record may be 14 hours old. Content quality looks good, but freshness observability identifies a serious issue.

Use both disciplines together.
