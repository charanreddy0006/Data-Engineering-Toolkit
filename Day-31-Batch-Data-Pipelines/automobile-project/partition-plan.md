# Partition Plan

| Dataset | Partition |
|---|---|
| Sales | sale_date |
| Service | service_date |
| Warranty | claim_date |
| EV Charging | session_date |
| Telemetry Aggregates | event_date |

## Principle

Choose a partition key from actual query and processing patterns.

Avoid extremely high-cardinality partitions such as vehicle_id unless there is a strong architectural reason.
