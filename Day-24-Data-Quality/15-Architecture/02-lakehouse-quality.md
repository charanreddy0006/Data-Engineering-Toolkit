# Lakehouse Quality Architecture

```text
Bronze
  + schema validation
  + raw-file integrity
  + ingestion completeness
       |
Silver
  + deduplication
  + standardization
  + referential integrity
  + domain validity
       |
Gold
  + business rules
  + reconciliation
  + consumer SLOs
```

Bronze preserves source evidence. Silver creates clean reusable data. Gold enforces consumer/business expectations.

Quality gates should be event-time aware so legitimate late-arriving data is not incorrectly classified as corrupt.
