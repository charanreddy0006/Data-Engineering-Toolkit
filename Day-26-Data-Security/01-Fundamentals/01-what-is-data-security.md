# What Is Data Security

## Purpose
Data security protects information against unauthorized access, disclosure, modification, destruction, and loss while keeping legitimate use possible.

## Why it matters

Data engineers move data across APIs, brokers, storage, compute, notebooks, warehouses, and data products. Every boundary creates security decisions.

## Lifecycle

```text
Source → Ingestion → Storage → Processing → Serving → Archive/Delete
                 Security controls apply everywhere
```

## Automotive

Telemetry can travel from a vehicle to a gateway, event broker, lakehouse, and analytics product. Each boundary needs identity, authorization, transport protection, and audit.
