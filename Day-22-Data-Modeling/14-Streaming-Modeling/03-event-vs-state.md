# Event vs State

An event describes something that happened.

A state describes what is true at a point in time.

## Events

```text
TRIP_STARTED
TRIP_ENDED
CHARGING_STARTED
CHARGING_STOPPED
FAULT_DETECTED
```

## State

```text
is_charging
vehicle_status
battery_soc
```

Events can often reconstruct state, but state tables can make serving queries faster.

## Recommended mental model

```text
Events -> authoritative history/replay
State  -> convenient serving representation
```

## Automobile example

Keep charging-start/stop events for audit and replay, then publish current charging status for
an operational dashboard.

Do not confuse the two grains.
