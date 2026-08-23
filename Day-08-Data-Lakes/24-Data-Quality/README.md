# 24 — Data Quality

## Core Dimensions

### Accuracy

Does the value represent reality?

### Completeness

Are required fields present?

### Consistency

Do related datasets agree?

### Timeliness

Is data arriving within the expected window?

### Uniqueness

Are duplicate records avoided?

### Validity

Does the value follow its expected format and range?

## Vehicle Rules

```text
battery: 0-100
speed: >= 0
vehicle_id: required
timestamp: valid
event_id: unique
```

## Quality Pipeline

```text
Input
 |
 v
Schema Check
 |
 v
Business Rules
 |
 +----> Invalid --> Quarantine
 |
 v
Clean Data
```

## Metrics

Track:

- Null percentage
- Duplicate count
- Invalid record count
- Freshness
- Row count
- Schema changes

Quality should be automated rather than checked manually after every pipeline.
