# 🧪 Mini Project — Vehicle Maintenance Feature Pipeline

## Objective

Create a small feature pipeline that transforms vehicle events into reusable features for a predictive-maintenance model.

## Input

`../examples/sample_vehicle_events.csv`

## Features

- distance_km_30d
- fault_count_24h
- harsh_braking_count_1h
- service_count_90d
- battery_soc_latest

## Workflow

```text
CSV Events
   ↓
Clean / Validate
   ↓
Aggregate
   ↓
Feature Table
   ↓
Training Dataset
   ↓
Online-Serving Design
```

## Deliverables

1. Data cleaning script
2. Feature SQL
3. Feature quality tests
4. Feature dictionary
5. Point-in-time training dataset
6. Monitoring specification

## Learning Goal

Focus on correctness and reproducibility rather than building a complicated ML model.
