USE automobile_dw;

CREATE TABLE IF NOT EXISTS vehicle_master (
    vehicle_id STRING,
    model STRING,
    manufacturer STRING,
    manufacture_year INT
)
STORED AS ORC;

INSERT INTO vehicle_master VALUES
('V001','SUV-X','AutoCorp',2024),
('V002','Sedan-Z','AutoCorp',2025),
('V003','EV-A','FutureMotors',2026);
