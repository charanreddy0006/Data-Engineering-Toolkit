# 8. SQL for BI

## Aggregation
```sql
SELECT dealer_id,
       SUM(service_amount) AS revenue
FROM fact_service
GROUP BY dealer_id;
```

## Conditional Aggregation
```sql
SELECT
    SUM(CASE WHEN status = 'COMPLETED' THEN 1 ELSE 0 END) AS completed_orders,
    COUNT(*) AS total_orders
FROM fact_service;
```

## Window Functions
```sql
SELECT
    vehicle_id,
    service_date,
    service_amount,
    SUM(service_amount) OVER (
        PARTITION BY vehicle_id
        ORDER BY service_date
    ) AS cumulative_spend
FROM fact_service;
```

## Ranking
```sql
SELECT dealer_id,
       SUM(service_amount) AS revenue,
       RANK() OVER (ORDER BY SUM(service_amount) DESC) AS revenue_rank
FROM fact_service
GROUP BY dealer_id;
```

## BI SQL Guidelines
- Filter early where appropriate.
- Select only needed columns.
- Avoid accidental many-to-many joins.
- Aggregate at the intended grain.
- Validate row counts after joins.
- Use explain plans for expensive queries.

## Automobile Question
"Which vehicle models generated the most service revenue in the last 90 days?"

Build the query using fact_service, dim_vehicle and dim_date.
