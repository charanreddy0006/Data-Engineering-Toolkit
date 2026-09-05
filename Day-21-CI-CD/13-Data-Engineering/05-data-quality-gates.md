# Data-Quality Gates

A release can be blocked by unsafe data behavior.

```text
deploy staging
 ↓
test dataset
 ↓
quality rules
 ↓
pass → production
fail → stop
```

Possible metrics:

- null rate,
- duplicate rate,
- invalid values,
- freshness,
- row-count anomalies,
- schema compatibility.

## Automobile example

A promotion may fail if:

```text
invalid battery values > 0.5%
```

Thresholds must come from business requirements.

Classify checks:

```text
critical
high
medium
informational
```
