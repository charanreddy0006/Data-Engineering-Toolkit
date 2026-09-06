# Event Modeling

Streaming systems commonly represent immutable business events.

Example:

```json
{
  "event_id": "evt-10001",
  "event_type": "vehicle.telemetry",
  "vehicle_id": "V100",
  "event_time": "2026-09-06T08:30:10Z",
  "ingestion_time": "2026-09-06T08:30:12Z",
  "sequence_number": 99123,
  "battery_soc": 74.5,
  "schema_version": 1
}
```

## Useful metadata

- event_id;
- event_type;
- event_time;
- ingestion_time;
- producer_id;
- schema_version;
- sequence_number;
- correlation_id.

## Event time vs processing time

Event time:

> When the measurement happened.

Processing time:

> When the platform processed it.

For telemetry, event time is normally the business timestamp.

## Why both?

A network outage can produce:

```text
event_time = 10:00
processing_time = 10:15
```

Using only processing time can distort historical analysis.
