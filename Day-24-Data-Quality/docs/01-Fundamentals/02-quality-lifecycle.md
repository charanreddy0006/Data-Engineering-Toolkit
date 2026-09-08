# Data Quality Lifecycle

## 1. Discover

Understand the source, producer, schema, business meaning, update frequency, and consumers.

## 2. Define

Document what good data means.

```text
vehicle_id: required
event_time: required
speed_kmh: 0..350
battery_soc: 0..100
event_id: unique
```

## 3. Validate

Run deterministic checks as close to the source or transformation as practical.

## 4. Measure

Store results such as:

```text
total_rows   = 1,000,000
failed_rows  = 2,000
pass_rate    = 99.8%
```

## 5. Monitor

Track metrics over time.

```text
Day 1 99.9%
Day 2 99.8%
Day 3 99.7%
Day 4 91.4%  <-- investigate
```

## 6. Remediate

Possible actions:

- reject
- quarantine
- repair
- replay
- backfill
- contact producer
- stop publication

## 7. Improve

Use incidents to improve contracts, source systems, validation, documentation, and ownership.

## Quality maturity

```text
Unknown -> Reactive -> Automated -> Observable -> Preventive -> Adaptive
```

The objective is to move quality controls earlier in the lifecycle.
