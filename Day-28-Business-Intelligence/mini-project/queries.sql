-- Revenue by dealer
SELECT d.dealer_name,
       SUM(f.service_amount) AS service_revenue
FROM fact_service f
JOIN dim_dealer d ON d.dealer_key = f.dealer_key
GROUP BY d.dealer_name
ORDER BY service_revenue DESC;

-- Revenue by month
SELECT dt.year,
       dt.month,
       dt.month_name,
       SUM(f.service_amount) AS revenue
FROM fact_service f
JOIN dim_date dt ON dt.date_key = f.date_key
GROUP BY dt.year, dt.month, dt.month_name
ORDER BY dt.year, dt.month;

-- Average order value
SELECT AVG(service_amount) AS average_service_value
FROM fact_service;
