# Automobile Industry Data Modeling Case Study


## Business Requirement

An automobile manufacturer wants one analytical platform covering:

```text
Vehicle Sales
Vehicle Service
Warranty
Connected Vehicle Telemetry
Dealer Performance
Customer Analytics
```

## Source Systems

```text
CRM
Dealer Management System
Service Management System
Warranty System
Telematics Platform
ERP
```

## Business Processes

Identify facts separately:

```text
Sales
Service
Warranty
Telemetry
```

## Sales Grain

> One row per completed vehicle sale transaction.

Dimensions:

```text
Date
Customer
Vehicle
Dealer
Location
```

Measures:

```text
quantity
gross_amount
discount
tax
net_amount
```

## Service Grain

> One row per completed service order.

Measures:

```text
labor_cost
parts_cost
total_cost
duration_minutes
```

## Telemetry Grain

> One row per telemetry event.

Measures:

```text
speed
engine_temperature
battery_level
distance_delta
```

## Warehouse Model

```text
                 DIM_DATE
                 /   |                   /    |           FACT_SALES FACT_SERVICE FACT_TELEMETRY
            |          |            |
            +----------+------------+
                       |
                  DIM_VEHICLE
                  /    |                  CUSTOMER MODEL  DEALER
```

## Vehicle Dimension

Important attributes:

```text
vehicle_id
VIN
model
variant
fuel_type
manufacture_year
region
owner
```

History candidates:

```text
owner
region
customer_segment
```

## Customer Dimension

```text
customer_id
customer_name
segment
city
state
country
```

History candidates:

```text
city
state
segment
```

## Dealer Dimension

```text
dealer_id
dealer_name
city
state
region
dealer_type
```

## Date Dimension

```text
date_key
calendar_date
day
month
quarter
year
fiscal_period
is_weekend
```

## Telemetry Challenges

Telemetry introduces:

```text
high volume
late events
duplicate events
device clock issues
schema evolution
```

Therefore model:

```text
event_id
event_time
ingest_time
vehicle_id
schema_version
```

## Example KPI

Revenue:

```sql
SELECT
    d.year,
    d.month,
    SUM(f.net_amount) AS revenue
FROM fact_sales f
JOIN dim_date d
  ON f.date_key = d.date_key
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
```

## Service Cost per Vehicle

```sql
SELECT
    vehicle_key,
    SUM(total_cost) AS service_cost
FROM fact_service
GROUP BY vehicle_key;
```

## Fault Frequency

```sql
SELECT
    vehicle_key,
    COUNT(*) AS fault_events
FROM fact_telemetry
WHERE event_type = 'FAULT'
GROUP BY vehicle_key;
```

## Modeling Risks

### Risk 1: Mixed Grain

Do not combine sale and telemetry measures in the same fact.

### Risk 2: Historical Ownership

Use an explicit historical strategy.

### Risk 3: Duplicate Telemetry

Use event identifiers and idempotent ingestion.

### Risk 4: Source Identifier Conflicts

Create a canonical vehicle identity mapping.

## Production Goal

The final model should allow an analyst to work with business concepts
without knowing every source-system implementation detail.
