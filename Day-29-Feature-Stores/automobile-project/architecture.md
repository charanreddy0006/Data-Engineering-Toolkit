# Capstone Architecture

```text
                    Vehicle Fleet
                         │
                         ▼
                 Event Ingestion
                         │
              ┌──────────┴──────────┐
              ▼                     ▼
        Stream Processing      Batch Processing
              │                     │
              ▼                     ▼
        Online Features       Offline Features
              │                     │
              ▼                     ▼
        Online Store           Offline Store
              │                     │
              │                Training Data
              │                     │
              └──────────┐   ┌──────┘
                         ▼   ▼
                      ML Models
                         │
                         ▼
                  Predictions/API
```

## Supporting Systems

- feature registry
- data quality
- monitoring
- lineage
- access control
- CI/CD
- cost management
