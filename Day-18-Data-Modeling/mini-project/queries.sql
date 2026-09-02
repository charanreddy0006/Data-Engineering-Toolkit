-- Monthly revenue
SELECT
    d.year_number,
    d.month_number,
    SUM(f.net_amount) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
GROUP BY d.year_number, d.month_number;

-- Revenue by manufacturer
SELECT
    v.manufacturer,
    SUM(f.net_amount) AS revenue
FROM fact_sales f
JOIN dim_vehicle v ON f.vehicle_key = v.vehicle_key
GROUP BY v.manufacturer
ORDER BY revenue DESC;

-- Units by dealer
SELECT
    d.dealer_name,
    SUM(f.quantity) AS units
FROM fact_sales f
JOIN dim_dealer d ON f.dealer_key = d.dealer_key
GROUP BY d.dealer_name;

-- Duplicate invoices
SELECT invoice_number, COUNT(*)
FROM fact_sales
GROUP BY invoice_number
HAVING COUNT(*) > 1;

-- Invalid amounts
SELECT *
FROM fact_sales
WHERE net_amount < 0;
