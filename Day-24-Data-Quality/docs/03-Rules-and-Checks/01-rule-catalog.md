# Data Quality Rule Catalog

A rule catalog makes quality expectations discoverable and maintainable.

Recommended fields:

```text
rule_id
dataset
field
dimension
expectation
threshold
severity
owner
action
version
enabled
```

Example:

```yaml
rule_id: DQ-TEL-004
dataset: vehicle_telemetry
field: battery_soc
dimension: validity
condition: "0 <= value <= 100"
threshold_pct: 99.99
severity: critical
action: quarantine
owner: telemetry-platform
version: 1
```

Rule lifecycle:

```text
Draft -> Review -> Enabled -> Tuned -> Deprecated
```

Version rules because changing a threshold changes the interpretation of historical quality results.
