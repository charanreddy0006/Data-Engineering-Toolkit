# Update, Insert, and Delete Anomalies

Poor models create three classic anomalies.

## Update anomaly

If dealer address is copied into 10,000 service rows, changing it requires many updates and risks
inconsistency.

## Insert anomaly

If a vehicle model can only be inserted when a vehicle exists, the model cannot be registered
before the first vehicle is sold.

## Delete anomaly

If dealer master information exists only inside service rows, deleting the last service row can
accidentally remove the only copy of dealer information.

## Better decomposition

```text
dealer
vehicle_model
vehicle
service_order
part
service_order_part
```

## Important nuance

Analytical duplication is not automatically an anomaly.

If a gold table intentionally copies `model_name` for BI convenience, document:

```text
source of truth = dim_model
derived copy = gold table
refresh = scheduled
quality = equality/reconciliation test
```

The principle is intentional duplication with controlled ownership.
