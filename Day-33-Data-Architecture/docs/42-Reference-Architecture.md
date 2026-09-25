# 42. Reference Architecture

```text
DB / API / Files / IoT / CDC / SaaS
                ↓
          Ingestion Layer
                ↓
           Raw Storage
                ↓
       Quality + Governance
                ↓
         Compute / Transform
                ↓
     Curated Lakehouse/Warehouse
                ↓
        Data Products / Semantic
          /       |                 BI       ML      Apps

Security + Observability + Reliability + Cost
```

This is a starting point. Adapt each layer to requirements and existing infrastructure.
