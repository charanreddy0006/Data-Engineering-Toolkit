SELECT
    f.warranty_claim_id,
    f.claim_date,
    d.vehicle_key,
    d.dealer_id
FROM fact_warranty f
JOIN dim_vehicle d
  ON d.vehicle_id = f.vehicle_id
 AND f.claim_date >= d.valid_from
 AND f.claim_date < d.valid_to;
