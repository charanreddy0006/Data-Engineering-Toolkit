MERGE INTO curated_service_orders AS target
USING staged_service_orders AS source
ON target.service_order_id = source.service_order_id
WHEN MATCHED THEN UPDATE SET
  vehicle_id = source.vehicle_id,
  dealer_id = source.dealer_id,
  service_date = source.service_date,
  amount = source.amount,
  updated_at = source.updated_at
WHEN NOT MATCHED THEN INSERT
  (service_order_id, vehicle_id, dealer_id, service_date, amount, updated_at)
VALUES
  (source.service_order_id, source.vehicle_id, source.dealer_id,
   source.service_date, source.amount, source.updated_at);
