SELECT service_order_id, vehicle_id, dealer_id, updated_at
FROM service_orders
WHERE updated_at > :last_watermark
  AND updated_at <= :current_watermark;
