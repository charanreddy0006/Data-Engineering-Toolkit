SELECT *
FROM service_orders
WHERE service_date >= :window_start
  AND service_date < :window_end;
