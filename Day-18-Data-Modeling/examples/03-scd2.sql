-- SCD Type 2 example for vehicle ownership/region history.

CREATE TABLE dim_vehicle_history (
    vehicle_key BIGSERIAL PRIMARY KEY,
    vehicle_id VARCHAR(50) NOT NULL,
    vin VARCHAR(17),
    owner_customer_id VARCHAR(50),
    region VARCHAR(100),
    valid_from DATE NOT NULL,
    valid_to DATE,
    current_flag BOOLEAN NOT NULL DEFAULT TRUE
);

-- Initial version
INSERT INTO dim_vehicle_history
(vehicle_id, vin, owner_customer_id, region, valid_from, valid_to, current_flag)
VALUES
('V001', 'VIN00000000000001', 'C001', 'South',
 DATE '2025-01-01', NULL, TRUE);

-- Ownership/region change:
-- 1. Expire current version.
UPDATE dim_vehicle_history
SET
    valid_to = DATE '2026-04-10',
    current_flag = FALSE
WHERE vehicle_id = 'V001'
  AND current_flag = TRUE;

-- 2. Insert the new version.
INSERT INTO dim_vehicle_history
(vehicle_id, vin, owner_customer_id, region, valid_from, valid_to, current_flag)
VALUES
('V001', 'VIN00000000000001', 'C002', 'West',
 DATE '2026-04-10', NULL, TRUE);

-- Historical lookup:
SELECT *
FROM dim_vehicle_history
WHERE vehicle_id = 'V001'
  AND DATE '2026-04-05' >= valid_from
  AND (DATE '2026-04-05' < valid_to OR valid_to IS NULL);
