# Odometer Quality

Basic rule:

```text
odometer_km >= 0
```

Temporal rule:

```text
current_odometer >= previous_odometer
```

SQL pattern:

```sql
LAG(odometer_km) OVER (
    PARTITION BY vehicle_id
    ORDER BY event_time
)
```

A decrease can be caused by:

- reset
- correction
- unit conversion
- replacement instrument cluster
- duplicate/out-of-order data

Therefore classify legitimate reset/correction events before treating every decrease as corruption.
