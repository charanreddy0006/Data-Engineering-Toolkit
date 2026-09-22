# 26. Model Drift

Model performance can degrade when the relationship between inputs and outcomes changes.

## Challenge

Ground truth may arrive later.

```text
Prediction
 ↓
Real-world outcome
 ↓
Delayed label
 ↓
Performance measurement
```

## Metrics

Depending on the task:
- precision
- recall
- F1
- MAE
- RMSE
- calibration

## Automobile

Compare maintenance-risk predictions with actual service events after the prediction window closes.
