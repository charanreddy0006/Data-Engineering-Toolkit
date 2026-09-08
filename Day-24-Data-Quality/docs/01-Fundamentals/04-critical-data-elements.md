# Critical Data Elements

A Critical Data Element (CDE) is a field whose failure can materially affect a business process.

## Automotive examples

| Field | Why critical |
|---|---|
| vehicle_id | Joins telemetry to a vehicle |
| event_time | Enables time-series analysis |
| VIN | Physical vehicle identity |
| diagnostic_code | Fault analysis |
| battery_soc | EV analytics |
| odometer_km | Service calculations |

## Classification

- Critical
- High
- Medium
- Low

Critical fields may deserve:

- stricter thresholds
- multiple validation layers
- stronger alerting
- faster remediation
- more detailed lineage

## Ownership

A CDE should have a business owner and technical owner, plus its source, definition, quality rules, SLA/SLO, and escalation path.
