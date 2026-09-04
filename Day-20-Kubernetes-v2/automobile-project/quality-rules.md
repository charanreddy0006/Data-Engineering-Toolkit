# Automobile Telemetry Quality Rules

| Rule | Condition | Severity |
|---|---|---|
| Vehicle ID | must not be null | Critical |
| Event ID | must be unique | Critical |
| Timestamp | valid ISO timestamp | Critical |
| Speed | >= 0 | High |
| Battery | 0..100 | High |
| Engine temperature | reasonable domain range | Medium |
| Odometer | non-negative | Medium |
| Schema | expected fields present | Critical |

## Quality result

A useful quality record can contain:

```text
run_id
event_id
vehicle_id
rule_id
status
observed_value
message
processed_at
```

## Engineering principle

Rules should be versioned. Changing a validation threshold changes data behavior and should therefore be traceable.
