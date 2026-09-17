# 3. OLTP vs OLAP

| Area | OLTP | OLAP |
|---|---|---|
| Purpose | Transactions | Analysis |
| Data | Current operational | Historical/analytical |
| Queries | Short | Complex |
| Writes | Frequent | Usually batch/controlled |
| Modeling | Often normalized | Often dimensional |
| Users | Applications | Analysts/business users |

## OLTP Example
A service application records:
```text
service_order_id
vehicle_id
dealer_id
service_date
labor_amount
```

## OLAP Example
A BI system calculates:
```text
monthly_service_revenue
average_service_value
warranty_claim_rate
```

## Why Separate Them?
Heavy analytical queries can compete with transactional workloads. An analytical platform provides structures optimized for aggregation and historical analysis.

## Automobile Flow
```text
Dealer Service App
      ↓
Operational DB
      ↓
ETL / ELT
      ↓
Analytical Warehouse
      ↓
Service Dashboard
```

## Interview Point
Do not simply say "OLTP is normalized and OLAP is denormalized." These are common patterns, not absolute rules.
