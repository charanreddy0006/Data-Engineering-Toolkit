# Hub, Link, Satellite

## Hub

Stores a durable business identity.

```text
vehicle_hk
vehicle_bk
load_dts
record_source
```

## Link

Stores a relationship.

```text
vehicle_hk
customer_hk
load_dts
record_source
```

## Satellite

Stores descriptive attributes and history.

```text
vehicle_hk
color
model
powertrain
hash_diff
load_dts
record_source
```

## Mental model

```text
Identity       -> Hub
Relationship   -> Link
Description    -> Satellite
```

Separating these allows different change rates and source systems to evolve independently.
