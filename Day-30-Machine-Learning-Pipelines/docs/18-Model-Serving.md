# 18. Model Serving

## Patterns

### Batch
Run the model as a data job.

### API
Expose prediction through an HTTP service.

### Embedded
Run model logic inside another application.

## API Architecture

```text
Client
 ↓
Gateway
 ↓
Inference Service
 ↓
Feature Store
 ↓
Model
 ↓
Prediction
```

## Production Concerns

- concurrency
- model loading
- latency
- errors
- versioning
- authentication
- observability

## Automobile

A dealer application can request a current maintenance score using a vehicle ID.
