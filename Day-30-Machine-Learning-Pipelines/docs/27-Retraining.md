# 27. Retraining

## Scheduled Retraining

Example:
```text
Every week → Candidate model
```

## Triggered Retraining

Potential triggers:
- measured performance decline
- major drift
- source changes
- new vehicle generation
- feature logic change

## Flow

```text
Trigger
 ↓
Training Dataset
 ↓
Train
 ↓
Evaluate
 ↓
Compare Baseline
 ↓
Approve
 ↓
Register
 ↓
Deploy
```

## Guardrail

Never assume a newly trained model should automatically replace the production model.
