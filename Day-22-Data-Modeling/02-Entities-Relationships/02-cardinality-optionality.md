# Cardinality and Optionality

Cardinality describes how many records participate in a relationship.

Common patterns:

```text
1:1
1:N
N:M
```

## One-to-many

A vehicle can make many trips:

```text
Vehicle 1 ───── N Trip
```

The foreign key normally appears on the many side.

```sql
CREATE TABLE trip (
    trip_id BIGINT PRIMARY KEY,
    vehicle_id BIGINT NOT NULL REFERENCES vehicle(vehicle_id)
);
```

## Many-to-many

A service order can use many parts, and a part can appear on many orders.

Use an associative table:

```text
service_order
      │
      │ 1:N
      ▼
service_order_part
      ▲
      │ N:1
      │
     part
```

## Optionality

A vehicle can exist before it has a retail customer.

Therefore:

```text
Vehicle -> Customer
0..1 current relationship
```

may be valid.

## Relationship attributes

Ownership may require:

```text
customer_id
vehicle_id
valid_from
valid_to
ownership_type
```

Then ownership becomes an entity:

```text
Customer ──< VehicleOwnership >── Vehicle
```

## Important distinction

"One customer owns many vehicles" does not mean "a vehicle has one customer forever."

History changes the model.
