# 29. Feature Store Cheat Sheet

## Core

```text
Feature = ML Input
Feature Store = Manage + Reuse + Serve Features
```

## Stores

```text
Offline → Historical → Training
Online  → Low Latency → Inference
```

## Most Important Concepts

```text
Entity
Feature View
Registry
Offline Store
Online Store
Materialization
Point-in-Time Correctness
Freshness
Training-Serving Skew
Monitoring
Versioning
Lineage
```

## Point-in-Time Rule

```text
feature_event_time <= prediction_time
```

## Quality

Check:
```text
Nulls
Validity
Uniqueness
Freshness
Distribution
Availability
```

## Automobile Examples

```text
fault_count_24h
service_count_90d
days_since_last_service
distance_km_30d
battery_soc_latest
energy_per_100km_30d
```

## Interview Formula

```text
Business Need
→ Feature Definition
→ Entity + Time
→ Transformation
→ Offline / Online
→ Serving
→ Quality
→ Monitoring
→ Governance
```
