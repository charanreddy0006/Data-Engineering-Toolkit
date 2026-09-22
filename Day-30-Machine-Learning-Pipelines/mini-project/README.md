# 🧪 Mini Project — Vehicle Maintenance ML Pipeline

## Objective

Build a small reproducible classification pipeline using vehicle-health features.

## Flow

```text
CSV
 ↓
Validation
 ↓
Time-Aware Split
 ↓
Training
 ↓
Evaluation
 ↓
Model Artifact
 ↓
Batch Predictions
```

## Features

- distance_km_30d
- fault_count_24h
- fault_count_7d
- service_count_90d
- days_since_last_service
- battery_soc_latest

## Tasks

1. Load the dataset.
2. Validate schema and ranges.
3. Use a time-aware split.
4. Train a baseline classifier.
5. Calculate precision, recall and F1.
6. Save the artifact and metadata.
7. Generate predictions.
8. Record model version.

## Learning Goal

Practice the complete **data → model → artifact → prediction** workflow.
