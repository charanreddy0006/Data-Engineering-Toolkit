# 15. Watermarks

A watermark represents progress in event time and helps a system decide when a window can be considered sufficiently complete.

```text
Out-of-order events
       ↓
Watermark advances
       ↓
Window becomes eligible for output
```

## Important
A watermark does not prove that no future late event can exist.

## Automobile
Set an appropriate lateness policy for telemetry expected to arrive several minutes late.
