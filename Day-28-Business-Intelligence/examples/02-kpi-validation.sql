-- Validate a warranty KPI against its numerator and denominator.
SELECT
    COUNT(DISTINCT CASE WHEN warranty_claim = TRUE THEN vehicle_id END) AS claim_vehicles,
    COUNT(DISTINCT CASE WHEN warranty_eligible = TRUE THEN vehicle_id END) AS eligible_vehicles,
    100.0 * COUNT(DISTINCT CASE WHEN warranty_claim = TRUE THEN vehicle_id END)
      / NULLIF(COUNT(DISTINCT CASE WHEN warranty_eligible = TRUE THEN vehicle_id END), 0)
      AS warranty_claim_rate_pct
FROM vehicle_warranty_daily;
