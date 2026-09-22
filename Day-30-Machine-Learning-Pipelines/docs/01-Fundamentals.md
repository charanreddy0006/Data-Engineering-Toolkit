# 1. ML Pipeline Fundamentals

An ML pipeline is an automated sequence of data and machine-learning operations that turns inputs into a model or predictions.

## Why pipelines?

A notebook can demonstrate an idea. Production requires repeatability, validation, versioning and monitoring.

## Typical flow

```text
Sources → Validation → Features → Training
                         ↓
                    Evaluation
                         ↓
                     Registry
                         ↓
                     Serving
```

## Pipeline properties

- reproducible
- testable
- observable
- versioned
- secure
- recoverable

## Data Engineering connection

ML systems depend on ingestion, storage, transformations, quality, orchestration and monitoring.

## Automobile example 🚗

Vehicle telemetry and service history are transformed into health features, used to train a service-risk model, and then scored against active vehicles.
