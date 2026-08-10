# OLTP vs OLAP

## 1. Introduction

Data systems are commonly designed for either operational workloads or analytical workloads.

Two important concepts are:

```text
OLTP → Online Transaction Processing
OLAP → Online Analytical Processing
```

## 2. OLTP

OLTP systems support day-to-day business operations.

Examples:

```text
Customer registration
Vehicle purchase
Payment
Service booking
Order creation
```

They usually handle many small transactions.

## 3. OLTP Characteristics

Typical characteristics:

- Frequent INSERT operations
- Frequent UPDATE operations
- Small transactions
- Low latency
- Strong consistency requirements
- Many concurrent users

Example:

```sql
INSERT INTO sales
VALUES (1001, 25, 501, 45000);
```

## 4. OLAP

OLAP systems are designed for analysis.

Examples:

```text
Monthly vehicle sales
Revenue analysis
Fleet performance
Customer behavior
EV adoption
Regional sales trends
```

OLAP queries often process large amounts of data.

Example:

```sql
SELECT
    brand,
    SUM(sale_amount)
FROM sales
GROUP BY brand;
```

## 5. OLAP Characteristics

Typical characteristics:

- Large analytical queries
- Aggregations
- Historical data
- Read-heavy workloads
- Complex joins
- Business intelligence

## 6. Basic Architecture

```text
OLTP Systems
     |
     v
ETL / ELT
     |
     v
Data Warehouse
     |
     v
OLAP
     |
     v
BI / Analytics
```

## 7. Example

An automobile company may use an OLTP database for:

```text
Vehicle Sales
Customer Accounts
Payments
Service Bookings
```

Data Engineers extract this data and load it into an analytical platform.

```text
PostgreSQL / MySQL
        |
        v
ETL Pipeline
        |
        v
Warehouse
        |
        v
Power BI / Tableau
```

## 8. OLTP Database Example

```text
customers
vehicles
sales
payments
service_records
```

These tables are optimized for operational transactions.

## 9. OLAP Example

An analytical model might contain:

```text
fact_vehicle_sales
        |
        +-- dim_customer
        +-- dim_vehicle
        +-- dim_dealer
        +-- dim_date
```

This structure supports analytical queries.

## 10. Comparison

| Feature | OLTP | OLAP |
|---|---|---|
| Purpose | Operations | Analytics |
| Workload | Transactions | Queries |
| Data | Current | Historical |
| Query size | Small | Large |
| Writes | Frequent | Usually less frequent |
| Reads | Short queries | Complex queries |
| Users | Applications | Analysts / BI |
| Example | Sales system | Sales warehouse |

## 11. Query Example

OLTP:

```sql
SELECT *
FROM vehicles
WHERE vehicle_id = 101;
```

This retrieves one operational record.

OLAP:

```sql
SELECT
    brand,
    year,
    SUM(sale_amount) AS revenue
FROM vehicle_sales
GROUP BY brand, year;
```

This analyzes many records.

## 12. Data Engineering Role

Data Engineers often build the bridge:

```text
OLTP
  |
  | Extract
  v
Staging
  |
  | Transform
  v
OLAP
  |
  v
Analytics
```

This separation prevents heavy analytical queries from unnecessarily affecting operational systems.

## 13. Automobile Example

An automobile manufacturer wants to know:

> Which vehicle models generated the highest revenue in each region during the last five years?

The operational database may contain individual sales.

The warehouse can contain historical data optimized for this analysis.

```text
Vehicle Sales
     |
     v
Data Pipeline
     |
     v
Historical Warehouse
     |
     v
Revenue Analysis
```

## 14. Hybrid Systems

Some modern databases support both operational and analytical workloads, but dedicated architectures are still common at scale.

Cloud platforms and lakehouse architectures can also combine multiple workload patterns.

## 15. Best Practices

- Keep operational and analytical workloads appropriately separated.
- Avoid heavy analytical queries on critical OLTP systems.
- Design warehouse models for analytical access.
- Maintain historical data where required.
- Monitor workload performance.

## Interview Questions

1. What is OLTP?
2. What is OLAP?
3. Difference between OLTP and OLAP?
4. Why are OLTP systems usually normalized?
5. Why are OLAP systems designed for analytical queries?
6. What is the role of a Data Engineer between OLTP and OLAP?
7. Give an automobile example of OLTP and OLAP.

## Summary

OLTP systems support business operations, while OLAP systems support large-scale analysis. Data Engineers connect these systems through reliable data pipelines.