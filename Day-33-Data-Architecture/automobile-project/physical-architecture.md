# Physical Architecture

```text
Vehicle → Gateway → Streaming Platform
                     ↓
                 Object Storage
                     ↓
              Distributed Compute
                     ↓
                 Lakehouse
                /                   Warehouse    Feature Store
             ↓              ↓
             BI             ML
```

Supporting services include identity, secrets, monitoring, orchestration, catalog/lineage and CI/CD.
