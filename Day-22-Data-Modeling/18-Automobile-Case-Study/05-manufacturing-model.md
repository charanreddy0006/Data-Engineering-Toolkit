# Automobile Manufacturing Model

Manufacturing data introduces another business process.

Potential entities:

```text
Plant
Production Line
Vehicle Build
Workstation
Manufacturing Event
Quality Inspection
```

## Build grain

> One row per vehicle build/order.

## Event grain

> One row per manufacturing event for one vehicle build.

Examples:

```text
BODY_ASSEMBLY_COMPLETED
BATTERY_INSTALLED
PAINT_COMPLETED
FINAL_INSPECTION_PASSED
```

## Quality inspection

A separate inspection fact can record:

```text
inspection_id
vehicle_build_id
inspection_type
inspection_time
result
defect_count
```

## Why separate events?

A build has lifecycle state, while manufacturing events are immutable occurrences.

Mixing them can make cycle-time and event analytics ambiguous.
