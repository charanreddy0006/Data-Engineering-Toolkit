-- Demonstrates why fact grain matters.

-- FACT_SALES:
-- one row per sale.
--
-- FACT_SERVICE:
-- one row per service order.
--
-- Joining both directly by vehicle can multiply rows.

WITH sales_by_vehicle AS (
    SELECT
        vehicle_key,
        SUM(net_amount) AS sales_revenue
    FROM fact_sales
    GROUP BY vehicle_key
),
service_by_vehicle AS (
    SELECT
        vehicle_key,
        SUM(total_cost) AS service_cost
    FROM fact_service
    GROUP BY vehicle_key
)
SELECT
    s.vehicle_key,
    s.sales_revenue,
    COALESCE(v.service_cost, 0) AS service_cost
FROM sales_by_vehicle s
LEFT JOIN service_by_vehicle v
    ON s.vehicle_key = v.vehicle_key;

-- This is safer than:
--
-- SELECT *
-- FROM fact_sales s
-- JOIN fact_service v
--   ON s.vehicle_key = v.vehicle_key;
--
-- because the direct join can create many-to-many multiplication.
