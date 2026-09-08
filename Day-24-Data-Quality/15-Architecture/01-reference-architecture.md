# Reference Data Quality Architecture

```text
Sources: DB / API / Files / IoT
              |
              v
        Ingestion Layer
              |
              v
       Contract Validation
          /           \
       valid         invalid
        |               |
        v               v
    Raw/Bronze      Quarantine/DLQ
        |
        v
 Transform + Quality Rules
          /       \
       valid      invalid
        |           |
        v           v
    Curated      Quarantine
        |
        v
    Data Products
        |
        +----> BI / ML
        |
        v
 Quality Metrics
        |
   Dashboard / Alerts
        |
     Incidents
        |
    Remediation
```

Design principles:

1. Validate early.
2. Preserve invalid evidence.
3. Store quality results.
4. Use risk-based severity.
5. Assign ownership.
6. Version rules and contracts.
7. Preserve lineage.
8. Design for replay.
