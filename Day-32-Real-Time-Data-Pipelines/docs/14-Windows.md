# 14. Windows

Windows group events for time-based calculations.

## Tumbling
```text
10:00–10:05
10:05–10:10
```

## Sliding
```text
10:00–10:10
10:05–10:15
```

## Session
Groups events around periods of activity.

## Automobile
Calculate:
- fault_count_5m
- harsh_braking_count_1h
- average_speed_10m

Always define time semantics and lateness behavior with the window.
