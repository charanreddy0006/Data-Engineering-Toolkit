# 21. Cloud Data Architecture

A cloud data platform commonly separates:

```text
Storage
Compute
Orchestration
Metadata
Security
Monitoring
```

## Reference
```text
Sources → Ingestion → Object Storage
                   ↓
                Compute
                   ↓
             Warehouse/Lakehouse
                   ↓
                Serving
```

## Benefits
Elasticity, managed infrastructure and scalable storage.

## Risks
Uncontrolled cost, network charges, vendor coupling and configuration complexity.
