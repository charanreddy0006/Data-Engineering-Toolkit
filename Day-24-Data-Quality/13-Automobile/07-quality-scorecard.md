# Automobile Quality Scorecard

## Telemetry

- validity
- completeness
- duplicate rate
- freshness
- fleet coverage

## Vehicle master

- identity uniqueness
- attribute completeness
- reference integrity
- temporal consistency

## Service

- work-order completeness
- state consistency
- cost validity
- vehicle/dealer integrity

Example:

```text
Metric                 Target    Actual
Telemetry validity     99.9%     99.95%
Telemetry freshness    <5 min    3.1 min
Vehicle coverage       99.0%     98.7%
Master uniqueness      100%      100%
Service integrity      99.9%     99.8%
```

Always expose failing rules underneath any summary score.
