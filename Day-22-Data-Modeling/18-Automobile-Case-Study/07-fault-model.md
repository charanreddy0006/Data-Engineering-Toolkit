# Vehicle Fault Event Model

## Fault grain

> One row represents one detected fault event for one vehicle.

Fields:

```text
fault_event_id
vehicle_id
event_time
fault_code
severity
source
cleared_at
```

## Event vs state

The fault detection is an event.

A current `fault_active` value is state.

Keep them conceptually separate.

## Analytics

- faults per 1,000 km;
- faults by model;
- severity distribution;
- recurring faults;
- time from detection to service.

## Quality

```text
fault_event_id unique
severity in allowed set
cleared_at >= event_time when present
vehicle exists or uses controlled unknown member
```
