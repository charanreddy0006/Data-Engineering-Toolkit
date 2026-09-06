# Entities and Attributes

An entity represents a business concept with identity and lifecycle.

Examples:

- Vehicle
- Customer
- Dealer
- Trip
- Service Order
- Part
- Warranty Claim
- Charging Session

An attribute describes an entity.

```text
Vehicle
  ├── VIN
  ├── model_year
  ├── powertrain_type
  └── production_date
```

## Entity vs attribute

"Vehicle" is an entity.

"VIN" is an attribute.

But if a concept has its own lifecycle and relationships, it may need to become an entity.

A service order has:

- status;
- timestamps;
- dealer;
- parts;
- labor;
- warranty information.

Therefore it should not be represented as `service1`, `service2`, and `service3` columns on Vehicle.

## Multivalued attributes

Bad:

```text
phone_1
phone_2
phone_3
```

Better:

```text
customer
customer_phone
```

This avoids an arbitrary maximum number of values.

## Derived attributes

`vehicle_age` can often be calculated from production date.

Storing derived values introduces synchronization risk unless there is a specific performance or
historical requirement.

## Identification questions

1. Does the business discuss this concept independently?
2. Does it have identity?
3. Does it have a lifecycle?
4. Can it have multiple related records?
5. Does its relationship to another entity have attributes?

## Automobile rule

Trips, faults, charging sessions, and service orders should generally be modeled as independent
business events when they have their own identities and lifecycle.
