# Data Vault Modeling

Data Vault is designed for historical integration and auditability.

Core structures:

```text
Hub       -> business keys
Link      -> relationships
Satellite-> descriptive history
```

## Automobile example

```text
HUB_VEHICLE
  vehicle_business_key

HUB_CUSTOMER
  customer_business_key

LINK_OWNERSHIP
  vehicle_hk
  customer_hk

SAT_VEHICLE
  color
  model
  powertrain
```

## Typical architecture

```text
Sources
  ↓
Raw Vault
  ↓
Business Vault
  ↓
Dimensional marts
```

## Why use it?

- multiple source systems;
- changing integrations;
- historical audit;
- traceability.

It is usually more complex than a simple dimensional warehouse, so the business case should justify
the complexity.
