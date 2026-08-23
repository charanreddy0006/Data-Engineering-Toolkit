# 19 — Advanced Data Lake Example

## Automotive Telemetry Architecture

```text
Vehicle
  |
  v
Kafka
  |
  v
Spark Streaming
  |
  +--------> Raw Events
  |
  v
Validation
  |
  +--------> Quarantine
  |
  v
Processed Parquet
  |
  v
Curated Tables
  |
  +----> BI
  +----> ML
```

## Production Concerns

### Idempotency

Events need a stable event identifier.

```text
event_id = vehicle_id + timestamp + sensor_sequence
```

### Late Events

Streaming systems may receive old events after newer events. Processing
should use event time and appropriate watermarks.

### Schema Evolution

New sensor fields may be added over time. The pipeline should handle compatible
changes without silently corrupting old data.

### Checkpointing

Streaming jobs need checkpoints so processing can resume safely after failure.

### Quality

Invalid values should be separated rather than silently discarded.

## Example Rules

```text
speed >= 0
battery between 0 and 100
temperature within expected range
vehicle_id not null
timestamp valid
event_id unique
```

## Production Goal

The system should be replayable, observable, secure, scalable, and recoverable.
