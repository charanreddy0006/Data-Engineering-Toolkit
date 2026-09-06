SELECT
    d.year,
    d.month,
    v.powertrain_type,
    SUM(f.distance_km) AS distance_km,
    SUM(f.energy_kwh) AS energy_kwh,
    CASE
        WHEN SUM(f.energy_kwh) > 0
        THEN SUM(f.distance_km) / SUM(f.energy_kwh)
    END AS fleet_km_per_kwh
FROM fact_trip f
JOIN dim_date d ON d.date_key = f.date_key
JOIN dim_vehicle v ON v.vehicle_key = f.vehicle_key
GROUP BY d.year, d.month, v.powertrain_type
ORDER BY d.year, d.month, v.powertrain_type;
