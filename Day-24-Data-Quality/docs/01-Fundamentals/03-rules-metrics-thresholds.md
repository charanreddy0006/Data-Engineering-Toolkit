# Rules, Metrics, Thresholds, and Gates

## Rule

Defines what should be true.

```text
battery_soc must be between 0 and 100.
```

## Metric

Measures what happened.

```text
battery_soc_valid_rate = 99.97%
```

## Threshold

Defines acceptable performance.

```text
battery_soc_valid_rate >= 99.90%
```

## Quality gate

Makes a processing decision.

```text
PASS -> publish
FAIL -> block/quarantine
```

## Hard vs soft

Hard rules can block publication when failure is critical.

Soft rules can warn while allowing processing.

Example policy:

```text
Critical -> stop publication
High     -> quarantine affected data
Medium   -> publish + warning
Low      -> metric only
```

## Threshold design

Do not select 95% merely because it sounds reasonable.

Consider:

- business impact
- historical baseline
- consumer requirements
- source reliability
- remediation cost
- contractual commitments

A quality score can summarize health, but always expose its underlying dimensions.
