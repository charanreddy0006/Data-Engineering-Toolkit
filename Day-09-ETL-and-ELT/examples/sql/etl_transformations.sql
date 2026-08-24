-- DAY 09 SQL ETL EXAMPLES

-- 1. Inspect raw data
SELECT *
FROM raw_vehicle_service
LIMIT 20;


-- 2. Find invalid records
SELECT *
FROM raw_vehicle_service
WHERE service_id IS NULL
   OR vehicle_id IS NULL
   OR service_cost IS NULL
   OR service_cost < 0;


-- 3. Create a standardized staging layer
CREATE VIEW staging_vehicle_service AS
SELECT
    TRIM(service_id) AS service_id,
    UPPER(TRIM(vehicle_id)) AS vehicle_id,
    CAST(service_date AS DATE) AS service_date,
    UPPER(TRIM(service_type)) AS service_type,
    CAST(service_cost AS DECIMAL(12, 2)) AS service_cost,
    updated_at
FROM raw_vehicle_service
WHERE service_id IS NOT NULL
  AND vehicle_id IS NOT NULL;


-- 4. Incremental extraction
SELECT
    service_id,
    vehicle_id,
    service_date,
    service_type,
    service_cost,
    updated_at
FROM raw_vehicle_service
WHERE updated_at > :last_watermark
  AND updated_at <= :current_watermark;


-- 5. Deduplicate by latest update
WITH ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY service_id
            ORDER BY updated_at DESC
        ) AS row_number
    FROM staging_vehicle_service
)
SELECT
    service_id,
    vehicle_id,
    service_date,
    service_type,
    service_cost,
    updated_at
FROM ranked
WHERE row_number = 1;


-- 6. Vehicle-level analytical summary
SELECT
    vehicle_id,
    COUNT(*) AS service_count,
    SUM(service_cost) AS total_service_cost,
    AVG(service_cost) AS average_service_cost,
    MAX(service_date) AS last_service_date
FROM staging_vehicle_service
WHERE service_cost >= 0
GROUP BY vehicle_id;


-- 7. Business classification
SELECT
    service_id,
    vehicle_id,
    service_cost,
    CASE
        WHEN service_cost < 500 THEN 'LOW'
        WHEN service_cost < 2000 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS cost_category
FROM staging_vehicle_service;


-- 8. Reconciliation
SELECT
    (SELECT COUNT(*) FROM raw_vehicle_service) AS raw_count,
    (SELECT COUNT(*) FROM staging_vehicle_service) AS staged_count;
