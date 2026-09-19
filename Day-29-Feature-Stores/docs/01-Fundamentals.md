# 1. Feature Store Fundamentals

## What Is a Feature?

A feature is an input variable used by a machine learning model.

Examples:
- vehicle_age_days
- average_speed_7d
- service_count_90d
- battery_soc
- harsh_braking_count_24h

A feature can be numeric, categorical, boolean, textual, vector-based or another representation supported by the model.

## What Is a Feature Store?

A feature store is a data platform or layer used to manage, store, transform, discover, and serve machine learning features consistently.

It helps teams reuse features instead of rebuilding the same logic independently for every model.

## Core Idea

```text
Raw Data
   ↓
Feature Transformation
   ↓
Managed Feature
   ↓
Training + Inference
```

## Why It Matters

Without a managed feature workflow, teams often face:
- duplicated feature logic
- inconsistent calculations
- difficult feature discovery
- poor lineage
- stale production values
- training/serving mismatches

## Example

A predictive-maintenance team defines:

```text
service_count_90d =
number of completed services for a vehicle
during the previous 90 days
```

The same definition can support multiple models.

## Important Principle

A feature is not just a column. It has:
- definition
- entity
- timestamp semantics
- transformation logic
- owner
- quality expectations
- freshness expectation
- version/history
