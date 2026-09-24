# 11. Event Schemas

Schemas define event structure, types and semantics.

Example:
```json
{
  "event_id":"E1",
  "vehicle_id":"V1",
  "event_time":"2026-09-24T10:00:00Z",
  "speed_kmh":62.4,
  "battery_soc":71
}
```

## Document
- required fields
- types
- units
- time meaning
- optional fields
- version
- compatibility rules

## Automobile
Document whether `speed_kmh` is vehicle speed and state its unit explicitly.
