# Quality Metrics

Treat quality results as data.

Example table:

```sql
CREATE TABLE data_quality_result (
    run_id TEXT NOT NULL,
    dataset TEXT NOT NULL,
    rule_id TEXT NOT NULL,
    run_time TIMESTAMP NOT NULL,
    total_rows BIGINT,
    failed_rows BIGINT,
    pass_rate NUMERIC(8,4),
    severity TEXT,
    status TEXT,
    PRIMARY KEY (run_id, rule_id)
);
```

Track:

- total rows
- failed rows
- null rate
- duplicate rate
- invalid rate
- freshness
- source-to-target lag
- coverage
- reconciliation differences

Historical metrics expose gradual degradation that a one-time test cannot.
