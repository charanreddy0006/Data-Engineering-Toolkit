SELECT
    vehicle_key,
    snapshot_date,
    end_odometer_km,
    end_battery_soc,
    daily_distance_km
FROM vehicle_daily_snapshot
WHERE snapshot_date = DATE '2026-09-06';
