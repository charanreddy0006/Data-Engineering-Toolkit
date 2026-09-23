SELECT
    s.total_rows AS source_rows,
    t.total_rows AS target_rows,
    s.total_amount AS source_amount,
    t.total_amount AS target_amount,
    s.total_rows - t.total_rows AS row_difference,
    s.total_amount - t.total_amount AS amount_difference
FROM (
    SELECT COUNT(*) total_rows, SUM(amount) total_amount
    FROM source_service_orders
    WHERE service_date = :batch_date
) s
CROSS JOIN (
    SELECT COUNT(*) total_rows, SUM(amount) total_amount
    FROM curated_service_orders
    WHERE service_date = :batch_date
) t;
