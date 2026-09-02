# Data Modeling for Streaming Data


## Why Streaming Data Is Different

Streaming systems receive events continuously.

Automobile telemetry can contain:

```text
vehicle_id
event_id
event_time
latitude
longitude
speed
battery_level
engine_temperature
```

## Event Model

A good event should have:

```text
Unique event identifier
Event timestamp
Source identifier
Entity identifier
Event type
Payload
```

Example:

```json
{
  "event_id": "evt-1001",
  "vehicle_id": "V001",
  "event_time": "2026-09-02T08:10:00Z",
  "event_type": "telemetry",
  "speed": 72.5,
  "battery_level": 84.2
}
```

## Event Time vs Processing Time

### Event Time

When the event actually happened.

### Processing Time

When the platform processed it.

They can differ because of:

- network delay
- device buffering
- offline vehicles
- retries
- ingestion delays

## Late Events

A vehicle may reconnect after being offline and send old events.

Therefore:

```text
event_time != ingestion_time
```

must be modeled explicitly.

## Idempotency

If the same event is delivered twice, the pipeline should avoid double-counting.

A unique `event_id` is extremely useful.

## Raw Event Table

```text
event_id
vehicle_id
event_time
ingest_time
event_type
payload
```

## Curated Event Table

```text
event_id
vehicle_key
event_time
speed
battery_level
engine_temperature
```

## Aggregation

A gold table might use:

```text
vehicle_id
date
total_distance
average_speed
max_temperature
fault_count
```

Grain:

> One row per vehicle per day.

## Streaming + Dimensional Data

A streaming fact can still reference dimensions, but enrichment must account
for:

- late dimension arrival
- dimension changes
- state management
- event-time semantics

## Automobile Example

```text
Vehicle
  ↓
Telematics Gateway
  ↓
Kafka
  ↓
Stream Processor
  ↓
Raw Event Store
  ↓
Curated Telemetry
  ↓
Daily Vehicle Metrics
```

## Modeling Checklist

```text
[ ] Event ID
[ ] Entity ID
[ ] Event time
[ ] Ingestion time
[ ] Event type
[ ] Schema version
[ ] Deduplication strategy
[ ] Late-arrival strategy
[ ] Retention
[ ] Replay strategy
```
