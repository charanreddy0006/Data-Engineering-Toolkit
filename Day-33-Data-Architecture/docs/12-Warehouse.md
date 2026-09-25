# 12. Data Warehouse Architecture

A warehouse is optimized for analytical workloads.

```text
Sources
 ↓
ETL / ELT
 ↓
Staging
 ↓
Warehouse
 ↓
Facts + Dimensions
 ↓
Marts / Semantic
 ↓
BI
```

## Strengths
- SQL analytics
- dimensional modeling
- governed reporting

## Automobile
Use fact_service, fact_sales and fact_warranty with dimensions such as date, vehicle, dealer and customer.
