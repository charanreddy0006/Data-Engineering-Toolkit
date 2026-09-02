# Data Modeling with dbt


## Why dbt Matters

dbt is commonly used to transform warehouse data using SQL while treating
transformations as maintainable code.

A typical project separates:

```text
Sources
Staging
Intermediate
Marts
```

## Example Structure

```text
models/
├── staging/
│   ├── stg_vehicle.sql
│   └── stg_sales.sql
├── intermediate/
│   └── int_vehicle_sales.sql
└── marts/
    ├── dim_vehicle.sql
    └── fact_sales.sql
```

## Staging

Staging models usually:

- rename columns
- standardize types
- clean source structures
- expose a stable interface

Example:

```sql
SELECT
    vehicle_id,
    vin,
    model_id,
    CAST(manufacture_year AS INTEGER) AS manufacture_year
FROM raw.vehicle;
```

## Dimension Model

```sql
SELECT
    vehicle_key,
    vehicle_id,
    vin,
    model_name,
    manufacturer,
    fuel_type
FROM {{ ref('int_vehicle') }};
```

## Fact Model

```sql
SELECT
    sale_id,
    date_key,
    vehicle_key,
    dealer_key,
    customer_key,
    net_amount
FROM {{ ref('int_sales') }};
```

## Sources

Sources define where raw data comes from.

Conceptually:

```text
source()
   ↓
staging
   ↓
intermediate
   ↓
marts
```

## Tests

Common tests include:

```text
unique
not_null
relationships
accepted_values
```

Example concept:

```yaml
columns:
  - name: vehicle_key
    tests:
      - not_null
```

## Documentation

A good dbt model documents:

```text
Purpose
Grain
Owner
Sources
Business definitions
Known limitations
```

## Modeling Rule

Do not use dbt to hide a bad model.

First define:

```text
Business process
Grain
Dimensions
Facts
History
```

Then implement transformations.

## Automobile dbt Architecture

```text
Raw PostgreSQL / CDC / Lake
          ↓
       dbt staging
          ↓
      dbt intermediate
          ↓
      dbt dimensional marts
          ↓
         BI
```

## Practical Exercise

Create dbt models:

```text
stg_vehicle
stg_sales
dim_vehicle
dim_customer
dim_dealer
fact_sales
```

Add tests for:

```text
primary identifiers
foreign keys
accepted fuel types
non-negative amounts
```
