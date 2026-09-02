# Entities, Attributes, Relationships and Cardinality


## Entity

An entity is a distinguishable business object.

Examples:

```text
Customer
Vehicle
Dealer
Model
Service Order
Warranty Claim
```

## Attribute

An attribute describes an entity.

Vehicle:

```text
VIN
manufacture_year
fuel_type
color
model
```

## Identifier

Each entity needs a way to identify instances.

```text
Customer → customer_id
Vehicle  → vehicle_id / VIN
Dealer   → dealer_id
```

## Relationship

A relationship explains how entities interact.

```text
Customer ── owns ── Vehicle
Dealer ── sells ── Vehicle
Vehicle ── receives ── Service Order
```

## Cardinality

Cardinality describes how many records participate.

### 1:1

```text
Vehicle 1 ─── 1 Registration
```

### 1:N

```text
Customer 1 ─── N Vehicle
```

### M:N

```text
Vehicle N ─── N Feature
```

M:N usually becomes:

```text
VEHICLE
   |
VEHICLE_FEATURE
   |
FEATURE
```

## Optionality

Relationships can be optional.

```text
Vehicle 1 ─── 0..N ServiceOrder
```

A newly manufactured vehicle may have zero service records.

## Relationship Direction

Do not infer relationships merely from names.

For example:

```text
Dealer → Vehicle
```

is incomplete.

Ask:

```text
Does a dealer sell many vehicles?
Can a vehicle be sold by multiple dealers over time?
Does the relationship represent inventory, sale, or servicing?
```

Business meaning matters.

## Weak and Strong Entities

Some entities depend strongly on a parent.

Example:

```text
ServiceOrder
ServiceLine
```

A service line has little business meaning without its service order.

## Associative Entities

For many-to-many relationships, create an associative structure.

```text
vehicle_feature
---------------
vehicle_id
feature_id
installed_date
```

The relationship itself can have attributes.

## Hierarchical Relationships

Organizations often contain hierarchies:

```text
Manufacturer
    ↓
Brand
    ↓
Model
    ↓
Variant
    ↓
Vehicle
```

The model should preserve the level at which each attribute belongs.

## Common Mistake

Putting model attributes inside every vehicle record can create unnecessary
duplication:

```text
vehicle_id
model_name
manufacturer
engine_type
model_launch_year
```

If model attributes are shared by thousands of vehicles, a separate model
entity may be appropriate.

## Modeling Checklist

For every entity:

```text
[ ] Business definition written
[ ] Identifier selected
[ ] Attributes listed
[ ] Attribute ownership understood
[ ] Relationships identified
[ ] Cardinality defined
[ ] Optionality defined
[ ] Historical behavior considered
```

## Practical Exercise

Model:

```text
Customer
Vehicle
Feature
Dealer
Service
```

Then identify every 1:N and M:N relationship.
