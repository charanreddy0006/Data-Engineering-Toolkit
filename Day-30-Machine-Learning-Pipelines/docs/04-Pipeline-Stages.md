# 4. Pipeline Stages

A production pipeline can be divided into clear stages:

1. Ingestion
2. Validation
3. Cleaning
4. Transformation
5. Feature engineering
6. Dataset creation
7. Training
8. Evaluation
9. Registration
10. Deployment
11. Inference
12. Monitoring

## Clear contracts

Each stage should have known inputs and outputs.

```text
validate_data
     ↓
build_features
     ↓
train_model
     ↓
evaluate_model
```

## Failure behavior

Stop downstream publication when a critical precondition fails.

Examples:
- required column missing
- empty dataset
- invalid feature range
- metric below release threshold

## Idempotency

Rerunning a stage should not create unintended duplicate outputs.
