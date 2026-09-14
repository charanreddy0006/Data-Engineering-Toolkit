# Connected Vehicle Telemetry Governance

## Purpose
Govern high-volume vehicle events.

## Example Event

```json
{
  "vehicle_id": "V10001",
  "event_time": "2026-09-14T10:15:00Z",
  "signal": "battery_soc",
  "value": 81.5,
  "unit": "percent"
}
```

## Governance

Define identifier semantics, timestamp standard, units, valid ranges, producer,
classification, retention, lineage, quality rules, and approved consumers.
