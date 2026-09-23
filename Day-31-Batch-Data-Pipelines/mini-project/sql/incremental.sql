SELECT *
FROM service_orders
WHERE updated_at > :last_watermark
  AND updated_at <= :current_watermark;
