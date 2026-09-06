# Event vs Snapshot

Event:

> Something happened.

Snapshot:

> What was the state at an interval?

Automobile:

```text
CHARGING_STARTED -> event
vehicle_daily     -> snapshot
```

Events are useful for history and replay.

Snapshots are useful for state-oriented reporting.

A production platform may maintain both.
