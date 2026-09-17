-- Automobile BI analytical SQL
WITH monthly AS (
    SELECT
        DATE_TRUNC('month', service_date) AS month,
        dealer_id,
        SUM(labor_amount + parts_amount) AS service_revenue,
        COUNT(*) AS service_orders
    FROM fact_service
    WHERE service_date >= CURRENT_DATE - INTERVAL '12 months'
    GROUP BY 1, 2
)
SELECT
    month,
    dealer_id,
    service_revenue,
    service_orders,
    service_revenue / NULLIF(service_orders, 0) AS avg_order_value
FROM monthly
ORDER BY month, dealer_id;
