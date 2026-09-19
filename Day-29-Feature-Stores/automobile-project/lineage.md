# Feature Lineage

```text
vehicle_telemetry
      ↓
clean_vehicle_events
      ↓
daily_vehicle_usage
      ↓
rolling_vehicle_features
      ↓
vehicle_health_feature_view
      ↓
predictive_maintenance_model
```

## Service Lineage

```text
service_orders
      ↓
eligible_completed_services
      ↓
days_since_last_service
      ↓
maintenance_model
```

## Warranty Lineage

```text
warranty_claims
      ↓
claim_aggregates
      ↓
warranty_risk_features
      ↓
warranty_risk_model
```
