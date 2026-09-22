# 34. Cheat Sheet

## Core

```text
Data → Validate → Features → Train → Evaluate
→ Register → Deploy → Predict → Monitor → Retrain
```

## Training

```text
Dataset + Features + Labels
          ↓
       Training
          ↓
      Evaluation
          ↓
      Model Artifact
```

## Serving

```text
Data / Entity
 ↓
Features
 ↓
Model
 ↓
Prediction
```

## Track

```text
Data Version
Feature Version
Code Commit
Parameters
Model Version
Metrics
Environment
```

## Monitor

```text
System
Data
Features
Predictions
Model Performance
Business Outcomes
```

## Production Rules

1. Validate data.
2. Prevent leakage.
3. Keep training and serving consistent.
4. Version artifacts.
5. Use approval gates.
6. Monitor production.
7. Keep rollback capability.
