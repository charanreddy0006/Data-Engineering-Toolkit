# 11. Experiment Tracking

Track each model experiment automatically.

## Record

- run ID
- dataset version
- features
- parameters
- metrics
- code version
- environment
- artifact

## Example

```yaml
run_id: 2026-09-22-001
model: gradient_boosting
dataset: vehicle_training_v12
feature_set: health_v4
f1: 0.835
```

## Why?

Without tracking, successful experiments are difficult to reproduce.

## Best practice

Store metadata with the training run instead of relying on notebook comments.

## Automobile

Keep comparable maintenance-risk experiments under the same validation protocol so the team can explain why a candidate changed.
