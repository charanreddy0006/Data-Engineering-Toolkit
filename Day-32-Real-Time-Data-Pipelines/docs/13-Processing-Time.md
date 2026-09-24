# 13. Processing Time

Processing time is when a stream processor handles a record.

```text
event_time:      10:00:00
arrival:         10:00:03
processing_time: 10:00:03
```

## Use
Processing time is useful for operational latency calculations.

## Compare
```text
event time      → business chronology
processing time → system chronology
```

## Automobile
Store event and processing timestamps to measure end-to-end telemetry delay.
