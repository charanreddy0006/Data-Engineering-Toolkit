# 10 — Data Organization

A good directory strategy makes datasets discoverable and maintainable.

## Recommended Layout

```text
data-lake/
├── raw/
│   ├── telemetry/
│   └── sales/
├── processed/
│   ├── telemetry/
│   └── sales/
├── curated/
│   ├── vehicle_health/
│   └── sales_summary/
└── quarantine/
```

## Naming

Use predictable names.

```text
vehicle_telemetry
vehicle_health_daily
service_events
```

Avoid unclear names such as:

```text
final2
new_data
test_latest
```

## Partitioning

A common telemetry layout is:

```text
telemetry/
year=2026/
month=08/
day=23/
```

Do not create excessively high-cardinality partitions such as one partition
per vehicle unless the workload truly benefits from it.
