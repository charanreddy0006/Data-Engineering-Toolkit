-- Revenue
SELECT
    d.year_number,
    d.month_number,
    SUM(f.net_amount) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
GROUP BY d.year_number, d.month_number
ORDER BY d.year_number, d.month_number;

-- Service cost by vehicle
SELECT
    v.vehicle_id,
    SUM(s.total_cost) AS total_service_cost
FROM fact_service s
JOIN dim_vehicle v ON s.vehicle_key = v.vehicle_key
GROUP BY v.vehicle_id
ORDER BY total_service_cost DESC;

-- Telemetry health indicators
SELECT
    vehicle_key,
    event_date,
    COUNT(*) AS event_count,
    AVG(speed_kmh) AS avg_speed,
    MAX(engine_temperature_c) AS max_temperature,
    AVG(battery_level) AS avg_battery
FROM fact_telemetry
GROUP BY vehicle_key, event_date;

-- Fault frequency
SELECT
    vehicle_key,
    COUNT(*) AS fault_count
FROM fact_telemetry
WHERE event_type = 'fault'
GROUP BY vehicle_key
ORDER BY fault_count DESC;

-- Dealer sales
SELECT
    d.dealer_name,
    SUM(f.quantity) AS units,
    SUM(f.net_amount) AS revenue
FROM fact_sales f
JOIN dim_dealer d ON f.dealer_key = d.dealer_key
GROUP BY d.dealer_name
ORDER BY revenue DESC;
