# 7. Staging

Staging creates a controlled boundary between source systems and transformation logic.

```text
Source → Staging → Curated → Serving
```

## Benefits

- replayability
- easier debugging
- source isolation
- auditability
- safer transformations

## Typical staging metadata

```text
batch_id
source_system
ingested_at
source_file
record_hash
```

## Automobile examples

```text
stg_service_orders
stg_warranty_claims
stg_vehicle_master
stg_sales
```
