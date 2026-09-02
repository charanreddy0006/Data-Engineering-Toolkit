# OLTP vs OLAP Modeling


## OLTP

Online Transaction Processing supports operational applications.

Examples:

```text
Register vehicle
Create customer
Process sale
Create service order
Record payment
```

Typical characteristics:

```text
Many small transactions
Frequent updates
Low-latency writes
Current state
Strong integrity
```

## OLAP

Online Analytical Processing supports analytical workloads.

Examples:

```text
Revenue by month
Sales by model
Service cost by region
Warranty trends
Vehicle utilization
```

Typical characteristics:

```text
Large reads
Aggregations
Historical data
Complex joins
Longer-running queries
```

## Modeling Difference

OLTP often favors:

```text
3NF / normalized relational models
```

OLAP often favors:

```text
Star
Snowflake
Wide analytical tables
Data Vault + dimensional marts
```

## Why Separate Them?

Imagine a dashboard runs:

```sql
SELECT
    model,
    region,
    SUM(amount)
FROM millions_of_sales
GROUP BY model, region;
```

Running this directly on the production application database can compete with
transactions.

A data platform separates workloads.

## Typical Architecture

```text
Application
    ↓
OLTP Database
    ↓
CDC
    ↓
Raw Data
    ↓
Transformation
    ↓
Warehouse
    ↓
BI
```

## Comparison

| Area | OLTP | OLAP |
|---|---|---|
| Primary purpose | Operations | Analytics |
| Writes | Frequent | Pipeline-driven |
| Queries | Short | Complex |
| Data state | Current | Historical |
| Modeling | Normalized | Dimensional |
| Users | Applications | Analysts / BI |

## Automobile Example

OLTP:

```text
vehicle
customer
dealer
service_order
payment
```

OLAP:

```text
fact_sales
fact_service
fact_telemetry
dim_vehicle
dim_customer
dim_dealer
dim_date
```

## Important

OLTP and OLAP are workload categories, not simply database product names.

A platform can support analytical workloads without following every traditional
warehouse pattern, but the workload distinction remains important.

## Interview Rule

If asked why you would not run analytics directly on OLTP, answer:

> Because operational and analytical workloads have different access patterns,
> resource requirements, and optimization goals. Separating them protects
> transactional performance and allows the analytical model to be optimized
> independently.
