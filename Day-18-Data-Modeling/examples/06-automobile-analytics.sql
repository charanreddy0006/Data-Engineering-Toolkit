-- Automobile analytical queries.

-- 1. Monthly revenue
SELECT
    d.year_number,
    d.month_number,
    SUM(f.net_amount) AS revenue
FROM fact_sales f
JOIN dim_date d
  ON f.date_key = d.date_key
GROUP BY d.year_number, d.month_number
ORDER BY d.year_number, d.month_number;

-- 2. Revenue by manufacturer
SELECT
    v.manufacturer,
    SUM(f.net_amount) AS revenue
FROM fact_sales f
JOIN dim_vehicle v
  ON f.vehicle_key = v.vehicle_key
GROUP BY v.manufacturer
ORDER BY revenue DESC;

-- 3. Units by dealer
SELECT
    d.dealer_name,
    SUM(f.quantity) AS units
FROM fact_sales f
JOIN dim_dealer d
  ON f.dealer_key = d.dealer_key
GROUP BY d.dealer_name
ORDER BY units DESC;

-- 4. Revenue by customer segment
SELECT
    c.customer_segment,
    SUM(f.net_amount) AS revenue
FROM fact_sales f
JOIN dim_customer c
  ON f.customer_key = c.customer_key
GROUP BY c.customer_segment;

-- 5. Telemetry daily summary
SELECT
    vehicle_key,
    event_date,
    COUNT(*) AS events,
    AVG(speed_kmh) AS average_speed,
    MAX(engine_temperature_c) AS maximum_temperature
FROM fact_telemetry
GROUP BY vehicle_key, event_date;
