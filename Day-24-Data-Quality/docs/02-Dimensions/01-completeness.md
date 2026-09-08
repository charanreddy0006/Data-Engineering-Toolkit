# Completeness

Completeness measures whether required data is present.

```text
completeness =
present_required_values / expected_required_values
```

SQL:

```sql
SELECT
  100.0 * AVG(CASE WHEN vehicle_id IS NOT NULL THEN 1.0 ELSE 0.0 END)
  AS completeness_pct
FROM vehicle_telemetry;
```

## Conditional completeness

Not every field is universally required.

```sql
SELECT
  100.0 * AVG(
    CASE
      WHEN powertrain_type = 'EV'
       THEN CASE WHEN battery_soc IS NOT NULL THEN 1.0 ELSE 0.0 END
      ELSE 1.0
    END
  )
FROM vehicle_events;
```

## Best practices

- Define required fields by event type.
- Measure by partition/date.
- Track historical trends.
- Distinguish source missingness from transformation loss.
- Do not blindly replace nulls with defaults.

Null can mean "not applicable", "unknown", "not collected", or "lost". Those meanings should not be collapsed accidentally.
