# Troubleshooting Wrong Grain

## Warning signs

A table contains:

```text
trip_id
telemetry_event_id
service_order_id
```

and users cannot explain what one row represents.

## Questions

- Is this one trip?
- Can a trip have many telemetry events?
- Can a vehicle have many service orders?
- Are measures duplicated?

## Fix

Separate process-specific models:

```text
fact_trip
fact_telemetry
fact_service
```

Combine only after aggregating to a common reporting grain.
