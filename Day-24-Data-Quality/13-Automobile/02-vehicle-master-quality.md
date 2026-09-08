# Vehicle Master Quality

Typical fields:

```text
vehicle_id
vin
model_id
model_year
manufacture_date
powertrain_type
dealer_id
status
```

Checks:

- vehicle_id required
- vehicle_id unique
- VIN required and unique
- model_id exists
- dealer_id exists when required
- model year plausible
- controlled status
- manufacture_date not in future

Temporal consistency:

```text
manufacture_date <= sale_date <= retirement_date
```

Vehicle master quality affects telemetry joins, service analytics, warranty, fleet segmentation, and customer reporting.
