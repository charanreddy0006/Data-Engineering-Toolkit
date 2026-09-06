# Periodic Snapshot

A periodic snapshot records state at regular intervals.

Example:

> One row per vehicle per day.

```text
date_key
vehicle_key
odometer_km
battery_soc
available_range_km
daily_distance_km
```

## Why snapshots?

Questions about state need snapshots:

- fleet size;
- inventory;
- vehicle availability;
- end-of-day battery;
- account balance.

## Important distinction

Transaction:

```text
one row per trip
```

Snapshot:

```text
one row per vehicle-day
```

A vehicle with no trip can still have a daily snapshot if state reporting requires it.

## Storage

Rows grow approximately with:

```text
vehicles × days
```

Therefore retention and physical design matter.
