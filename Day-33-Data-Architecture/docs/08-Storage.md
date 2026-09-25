# 8. Storage Layer

Storage provides durable persistence.

## Common forms
- object storage
- warehouse
- operational database
- key-value store
- search store

## Layering
```text
Raw → Curated → Serving
```

Choose storage using:
- access pattern
- durability
- performance
- retention
- security
- cost

## Automobile
Raw telemetry can live in object storage while service and sales marts are served from an analytical warehouse.
