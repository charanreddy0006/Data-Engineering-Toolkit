# Event Time, Watermarks and Windows

These concepts are central to correct stream processing.

## Event Time

Suppose a vehicle generates an event at:

```text
10:30:02
```

The event may arrive at Flink at:

```text
10:30:07
```

The five-second difference is caused by transport or processing delay.

Event time lets the application reason about when the event actually happened.

## Processing Time

Processing time is based on the runtime clock.

```text
Occurred: 10:30:02
Arrived:  10:30:07
Processed:10:30:08
```

Processing-time applications are simpler but can be sensitive to arrival
timing.

## Watermarks

A watermark represents progress through event time.

```text
Events:
10:01
10:03
10:02
10:05

Watermark: 10:04
```

The watermark tells operators that events earlier than a certain point are
unlikely to arrive normally.

## Out-of-Order Events

```text
Expected:
10:01 → 10:02 → 10:03

Actual:
10:01 → 10:03 → 10:02
```

Watermarks allow Flink to handle this situation.

## Windows

Windows convert infinite streams into finite computation groups.

```text
Stream
 ↓
+------+------+
| W1   | W2   |
+------+------+
```

## Tumbling Window

No overlap.

```text
10:00–10:05
10:05–10:10
10:10–10:15
```

## Sliding Window

Windows overlap.

```text
10:00–10:10
10:05–10:15
10:10–10:20
```

## Session Window

Events are grouped by periods of activity.

```text
EEE     EE          EEEE
|---S1--| |---S2----| |S3|
```

## Late Events

A late event arrives after the expected event-time progress.

Applications should define:

- allowed lateness
- late-event output
- correction strategy
- monitoring

## Example

```sql
SELECT
    vehicle_id,
    AVG(speed)
FROM TABLE(
    TUMBLE(
        TABLE telemetry,
        DESCRIPTOR(event_time),
        INTERVAL '5' MINUTE
    )
)
GROUP BY vehicle_id;
```

## Automobile Use Case

Calculate average vehicle speed every five minutes using event time. This
prevents network delay from incorrectly moving events into another business
window.

## Key Rule

```text
Correct streaming analytics
        =
Event Time + Watermarks + Appropriate Windows
```
