# OLTP vs OLAP

| Area | OLTP | OLAP |
|---|---|---|
| Goal | Operations | Analysis |
| Writes | Frequent | Controlled |
| Reads | Selective | Large scans |
| Model | Normalized | Dimensional/wide |
| History | Operational | Extensive |
| Query | Short | Aggregation |
| Users | Applications | Analysts/BI |
| Example | Service booking | Warranty analytics |

OLTP:

```sql
SELECT *
FROM vehicle
WHERE vin = 'DEMO-VIN-001';
```

OLAP:

```sql
SELECT model_name, SUM(warranty_cost)
FROM fact_warranty
GROUP BY model_name;
```

## Key lesson

OLTP and OLAP are complementary models optimized for different access patterns.
