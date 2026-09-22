# 14. Model Validation

A candidate model should pass explicit validation gates before production.

## Gates

```text
Code Tests
 ↓
Data Tests
 ↓
Feature Tests
 ↓
Model Metric Tests
 ↓
Baseline Comparison
 ↓
Approval
```

## Example

```yaml
validation:
  minimum_f1: 0.80
  maximum_null_rate: 0.02
  require_baseline_comparison: true
```

Thresholds are business and use-case specific.

## Validate

- input schema
- feature ranges
- model loads
- prediction shape
- metrics
- artifact integrity

## Automobile

Reject a candidate maintenance model if its agreed recall/F1 gate is not met on the holdout period.
