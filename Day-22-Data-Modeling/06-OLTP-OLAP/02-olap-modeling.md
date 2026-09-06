# OLAP Modeling

OLAP supports analytical questions:

- Which models have highest warranty cost?
- What is distance by region?
- Which vehicles have increasing faults?
- How much energy was charged by month?

## Typical model

```text
dim_date
dim_vehicle
dim_customer
dim_dealer
dim_model
fact_trip
fact_service
fact_fault
fact_charge
```

## OLAP priorities

- historical analysis;
- aggregation;
- usability;
- scalable scans;
- consistent metrics.

## Architecture

```text
OLTP
  ↓
CDC / batch
  ↓
Raw / staging
  ↓
Warehouse
  ↓
Dimensional marts
  ↓
BI
```

Separating analytical reads from operational systems protects production applications.
