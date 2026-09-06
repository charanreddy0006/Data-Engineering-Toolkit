# Automobile Domain Model 🚗

The case study represents a connected-vehicle ecosystem.

## Entities

```text
Customer
Vehicle
Vehicle Model
Dealer
Trip
Telemetry Event
Fault Event
Service Order
Part
Warranty Claim
Charging Session
Manufacturing Event
```

## Relationships

```mermaid
erDiagram
    CUSTOMER ||--o{ VEHICLE_OWNERSHIP : has
    VEHICLE ||--o{ VEHICLE_OWNERSHIP : assigned
    VEHICLE_MODEL ||--o{ VEHICLE : defines
    VEHICLE ||--o{ TRIP : makes
    VEHICLE ||--o{ TELEMETRY_EVENT : emits
    VEHICLE ||--o{ FAULT_EVENT : reports
    VEHICLE ||--o{ SERVICE_ORDER : receives
    SERVICE_ORDER ||--o{ SERVICE_ORDER_PART : contains
    PART ||--o{ SERVICE_ORDER_PART : used
    VEHICLE ||--o{ WARRANTY_CLAIM : has
    VEHICLE ||--o{ CHARGING_SESSION : uses
    DEALER ||--o{ SERVICE_ORDER : handles
```

## Design decisions

- Vehicle identity is separate from ownership history.
- Trip and telemetry are separate grains.
- Parts use an associative structure.
- Charging is its own business process.
- Faults are immutable events.
- Ownership can be historical.

## Questions for a production workshop

- Can one vehicle have multiple drivers?
- How are leased vehicles represented?
- What exactly starts/ends a trip?
- Are telemetry events raw or derived?
- How are VIN corrections handled?
