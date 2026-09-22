# 9. Feature Store Integration

A feature store can manage reusable feature definitions and support historical and online retrieval.

## Training

```text
Labels + Prediction Times
        ↓
Point-in-Time Retrieval
        ↓
Training Dataset
```

## Inference

```text
Vehicle ID
   ↓
Online Feature Lookup
   ↓
Model
   ↓
Prediction
```

## Important concepts

- entities
- feature views
- offline store
- online store
- freshness
- lineage
- point-in-time correctness

## Automobile

A maintenance model can reuse approved vehicle-health features instead of recreating identical SQL for every model.
