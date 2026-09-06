CREATE TABLE dim_vehicle_history (
    vehicle_key BIGINT PRIMARY KEY,
    vehicle_id VARCHAR(50) NOT NULL,
    exterior_color VARCHAR(50),
    dealer_id BIGINT,
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP NOT NULL,
    is_current BOOLEAN NOT NULL,
    CHECK (valid_from < valid_to)
);

-- Expire the current version.
UPDATE dim_vehicle_history
SET valid_to = TIMESTAMP '2026-03-10 00:00:00',
    is_current = FALSE
WHERE vehicle_id = 'V100'
  AND is_current = TRUE;

-- Insert the new version.
INSERT INTO dim_vehicle_history (
    vehicle_key, vehicle_id, exterior_color, dealer_id,
    valid_from, valid_to, is_current
)
VALUES (
    2002, 'V100', 'Blue', 42,
    TIMESTAMP '2026-03-10 00:00:00',
    TIMESTAMP '9999-12-31 00:00:00',
    TRUE
);
