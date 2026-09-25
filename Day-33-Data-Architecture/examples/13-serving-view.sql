CREATE VIEW vehicle_service_summary AS
SELECT
    vehicle_id,
    COUNT(*) AS service_orders,
    SUM(service_amount) AS service_revenue
FROM curated_service_orders
GROUP BY vehicle_id;
