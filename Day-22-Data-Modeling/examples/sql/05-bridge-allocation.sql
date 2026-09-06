WITH technician_allocated AS (
    SELECT
        service_order_id,
        technician_key,
        allocation_pct,
        allocation_pct / 100.0 AS allocation_factor
    FROM service_order_technician
)
SELECT
    a.technician_key,
    SUM(o.total_cost * a.allocation_factor) AS allocated_cost
FROM service_order o
JOIN technician_allocated a
  ON a.service_order_id = o.service_order_id
GROUP BY a.technician_key;
