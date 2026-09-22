# 🚗 Automobile ML Pipeline Capstone

## Project
**Predictive Maintenance Pipeline for Connected Vehicles**

## Business Goal
Predict whether a vehicle is likely to require service within the next seven days.

## Sources
- Vehicle telemetry
- Service history
- Warranty history
- Vehicle master
- Dealer information

## End-to-End Flow

```text
Telemetry + Service Data
          ↓
       Ingestion
          ↓
     Data Quality
          ↓
  Feature Engineering
          ↓
      Feature Store
          ↓
  Training Data / Online Features
          ↓
       ML Model
          ↓
      Validation
          ↓
     Model Registry
          ↓
       Deployment
          ↓
      Predictions
          ↓
      Monitoring
          ↓
      Retraining
```

## Main Features

```text
fault_count_24h
fault_count_7d
distance_km_30d
service_count_90d
days_since_last_service
battery_soc_latest
```

## Consumers
- Dealer service systems
- Fleet operations
- Service advisors
- Analytics dashboards

## Key Principle
A production ML project is a complete data-and-software system, not only a model.
