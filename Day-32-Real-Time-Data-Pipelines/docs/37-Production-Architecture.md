# 37. Production Architecture

```text
                    Event Sources
                         ↓
                  ┌──────────────┐
                  │ Event Broker │
                  └──────┬───────┘
                         ↓
                ┌──────────────────┐
                │ Stream Processor │
                └───┬────┬────┬────┘
                    ↓    ↓    ↓
                  Alerts Features Lake
                    ↓    ↓      ↓
                 Apps  ML      Batch
                      Dashboards

Cross-cutting:
Schema • Security • Checkpoints • Monitoring • Cost • Governance
```

Production systems need controlled recovery, bounded state, scalable partitions and observable latency.
