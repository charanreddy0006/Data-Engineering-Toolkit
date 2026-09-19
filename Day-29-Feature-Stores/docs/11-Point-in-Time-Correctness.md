# 11. Point-in-Time Correctness

## Definition

Point-in-time correctness means a training feature value contains only information that was available at the prediction timestamp.

## Example

Prediction time:
```text
2026-08-10 10:00
```

A feature may use events before that time.

It must not use:
```text
2026-08-10 15:00
```

because that information did not exist yet at prediction time.

## Leakage Example

Suppose we predict whether a vehicle will fail within 7 days.

Incorrect:
```text
fault_count_next_7d
```

Correct:
```text
fault_count_previous_7d
```

## Why It Matters

Without point-in-time correctness, offline model evaluation may look better than real-world performance.

## Conceptual Join

```text
Entity + Prediction Timestamp
          ↓
Select latest valid feature record
          ↓
feature_time <= prediction_time
```

## Automobile Example

For predicting a service visit on September 20, do not use September 21 service records in training features.
