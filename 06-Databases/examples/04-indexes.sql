-- Database Indexes
-- Data Engineering Toolkit - Day 06

CREATE TABLE vehicle_sensor_data (
    record_id BIGINT PRIMARY KEY,
    vehicle_id VARCHAR(30) NOT NULL,
    sensor_time TIMESTAMP NOT NULL,
    speed DECIMAL(6, 2),
    battery_level DECIMAL(5, 2),
    temperature DECIMAL(5, 2)
);

INSERT INTO vehicle_sensor_data
VALUES
(1, 'EV001', '2026-08-10 10:00:00', 65, 95, 30.5),
(2, 'EV001', '2026-08-10 10:01:00', 68, 94, 30.8),
(3, 'EV002', '2026-08-10 10:00:00', 55, 80, 29.4),
(4, 'EV002', '2026-08-10 10:01:00', 60, 79, 29.8),
(5, 'EV003', '2026-08-10 10:00:00', 72, 90, 31.2);

-- Create an index for vehicle lookups
CREATE INDEX idx_sensor_vehicle
ON vehicle_sensor_data(vehicle_id);

-- Create a composite index
CREATE INDEX idx_sensor_vehicle_time
ON vehicle_sensor_data(vehicle_id, sensor_time);

-- Query using vehicle ID
SELECT *
FROM vehicle_sensor_data
WHERE vehicle_id = 'EV001';

-- Query using vehicle ID and timestamp
SELECT *
FROM vehicle_sensor_data
WHERE vehicle_id = 'EV001'
ORDER BY sensor_time DESC;

-- Check query plan in PostgreSQL
EXPLAIN
SELECT *
FROM vehicle_sensor_data
WHERE vehicle_id = 'EV001';

-- Detailed query execution
EXPLAIN ANALYZE
SELECT *
FROM vehicle_sensor_data
WHERE vehicle_id = 'EV001';

-- Remove an index
DROP INDEX idx_sensor_vehicle;