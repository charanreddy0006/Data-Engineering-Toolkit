# Conformed Dimensions

A conformed dimension has the same governed meaning across business processes.

Example:

```text
             dim_vehicle
              /       \
             /         \
       fact_trip     fact_service
```

Both facts should interpret `dim_vehicle` consistently.

## Why?

Without conformance:

```text
trip_model_name
service_model_name
warranty_model_name
```

may map source values differently.

Cross-domain reporting then becomes unreliable.

## Common conformed dimensions

- Date;
- Vehicle;
- Customer;
- Dealer;
- Model;
- Geography.

## Bus-matrix concept

| Process | Date | Vehicle | Customer | Dealer | Model |
|---|---|---|---|---|---|
| Trip | ✓ | ✓ | ✓ | | ✓ |
| Service | ✓ | ✓ | ✓ | ✓ | ✓ |
| Warranty | ✓ | ✓ | ✓ | ✓ | ✓ |
| Charging | ✓ | ✓ | | | ✓ |

This helps identify reusable enterprise dimensions.

## Rule

A dimension is conformed because its meaning is governed consistently, not simply because two tables
happen to have a column with the same name.
