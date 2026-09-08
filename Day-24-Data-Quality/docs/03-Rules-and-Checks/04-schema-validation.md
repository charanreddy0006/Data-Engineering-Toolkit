# Schema Validation

Schema validation checks structure:

- required fields
- types
- nested structure
- field names
- nullability
- schema version
- allowed additions/removals

Example contract:

```json
{
  "schema_version": "2",
  "required": ["event_id", "vehicle_id", "event_time"],
  "fields": {
    "speed_kmh": "double",
    "battery_soc": "double"
  }
}
```

Schema validation is necessary but not sufficient. A schema-valid event can still be stale, duplicated, inaccurate, or business-invalid.

Validate early so producer problems receive fast feedback.
