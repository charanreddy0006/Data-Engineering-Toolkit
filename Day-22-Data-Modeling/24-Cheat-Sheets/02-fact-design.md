# Fact Design One-Pager

Before creating a fact:

1. Select business process.
2. Write grain.
3. Identify dimensions.
4. Identify measures.
5. Classify additivity.
6. Define uniqueness.
7. Decide late-data behavior.
8. Define retention.
9. Add quality tests.

Examples:

```text
fact_trip          -> one trip
fact_telemetry     -> one event
fact_service_line  -> one line
vehicle_daily      -> one vehicle-day
charging_session   -> one session
```

Never mix these grains without an explicit design.
