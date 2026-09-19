# 🚗 Automobile Feature Store Capstone

## Project

**Predictive Maintenance Feature Platform for Connected Vehicles**

## Business Problem

Automobile manufacturers and fleet operators collect large volumes of vehicle telemetry, service records and warranty information.

The goal is to create reusable features that support machine learning models for:
- predictive maintenance
- service recommendations
- warranty risk
- vehicle health

## Users

- Data engineers
- ML engineers
- Data scientists
- Fleet analysts
- Service operations

## Architecture

```text
Vehicle Telemetry ───────┐
                         │
Service System ──────────┼──→ Data Platform
                         │          ↓
Warranty System ──────────┘     Feature Pipelines
                                    ↓
                           Feature Registry
                         ┌──────────┴──────────┐
                         ↓                     ↓
                    Offline Store         Online Store
                         ↓                     ↓
                    Model Training       Real-Time Model
```

## Production Features

### Vehicle Health
- fault_count_24h
- fault_count_7d
- battery_soc_latest

### Usage
- distance_km_7d
- distance_km_30d
- harsh_braking_count_24h

### Service
- days_since_last_service
- service_count_90d
- service_spend_365d

### EV
- fast_charge_ratio_30d
- energy_per_100km_30d

## Capstone Outcome

Document the data model, feature definitions, quality rules, serving requirements, security, monitoring and recovery strategy.
