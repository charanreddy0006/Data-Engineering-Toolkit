# 12. Event Time

Event time is when the event actually occurred.

```text
event_time = 10:00
arrival     = 10:03
```

## Why
Networks and devices can delay events.

For business windows, event time is often more meaningful than arrival/processing time.

## Automobile
A disconnected vehicle can upload buffered telemetry later. Event-time windows should place the event into the time period when it occurred.
