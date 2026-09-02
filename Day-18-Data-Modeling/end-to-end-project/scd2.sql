-- SCD2 processing outline.
--
-- Source record:
-- V001 / owner C001 / South
--
-- Incoming record:
-- V001 / owner C002 / West

BEGIN;

UPDATE dim_vehicle
SET
    valid_to = DATE '2026-09-02',
    current_flag = FALSE
WHERE vehicle_id = 'V001'
  AND current_flag = TRUE
  AND (
       owner_customer_id <> 'C002'
       OR owner_customer_id IS NULL
  );

INSERT INTO dim_vehicle (
    vehicle_id,
    vin,
    model_name,
    manufacturer,
    fuel_type,
    owner_customer_id,
    valid_from,
    valid_to,
    current_flag
)
SELECT
    'V001',
    'VIN00000000000001',
    'Model-A',
    'AutoCorp',
    'EV',
    'C002',
    DATE '2026-09-02',
    NULL,
    TRUE
WHERE NOT EXISTS (
    SELECT 1
    FROM dim_vehicle
    WHERE vehicle_id = 'V001'
      AND current_flag = TRUE
      AND owner_customer_id = 'C002'
);

COMMIT;

-- Production implementations should additionally address:
-- 1. concurrent updates
-- 2. duplicate source records
-- 3. effective timestamp precision
-- 4. late-arriving facts
-- 5. overlapping validity windows
-- 6. idempotent reruns
