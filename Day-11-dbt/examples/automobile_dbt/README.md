# Automobile dbt Example

## Flow

```text
raw.service_records
        |
        v
stg_service_records
        |
        v
int_vehicle_service
       /       v   v
dim_vehicle  fct_service_cost
```

## Commands

```bash
dbt debug
dbt seed
dbt build
dbt test
dbt docs generate
```

Use the correct adapter and profile for the selected warehouse.
Never commit real credentials.
