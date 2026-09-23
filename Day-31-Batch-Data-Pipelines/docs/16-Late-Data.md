# 16. Late-Arriving Data

A record can have an earlier event time than its arrival time.

```text
event_time:   10:00
arrival_time: 16:00
```

## Strategies

- rolling reprocessing window
- update affected partitions
- event-time calculations
- correction jobs

## Automobile

Vehicle telemetry may arrive late after a network outage. Recalculate the affected daily aggregate.

## Rule

Define a lateness policy explicitly instead of relying on accidental pipeline behavior.
