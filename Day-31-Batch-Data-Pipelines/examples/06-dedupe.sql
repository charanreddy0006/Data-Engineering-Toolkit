WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (
             PARTITION BY service_order_id
             ORDER BY updated_at DESC
           ) AS rn
    FROM staged_service_orders
)
SELECT *
FROM ranked
WHERE rn = 1;
