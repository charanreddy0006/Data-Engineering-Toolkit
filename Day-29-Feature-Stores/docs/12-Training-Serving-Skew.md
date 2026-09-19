# 12. Training-Serving Skew

## Definition

Training-serving skew occurs when the feature computation used during model training differs from the feature computation used in production inference.

## Example

Training:
```text
avg_speed_7d = SUM(distance) / SUM(duration)
```

Serving:
```text
avg_speed_7d = AVG(trip_speed)
```

These formulas are not necessarily equivalent.

## Risks

- degraded model accuracy
- hard-to-debug production behavior
- inconsistent experimentation
- unreliable model evaluation

## Causes

- duplicated logic
- different libraries
- different defaults
- different time windows
- timezone mismatches
- missing data handling differences

## Prevention

- centralize feature definitions
- reuse transformation logic
- version feature code
- test training and serving parity
- document defaults

## Automobile Example

Battery temperature normalization must use the same units and transformation during both model training and online scoring.
