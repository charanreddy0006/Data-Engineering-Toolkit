# Automobile CI/CD Incident Scenario

A new telemetry transformation reaches production.

After 15 minutes:

```text
duplicate_event_rate = 3%
expected < 0.1%
```

## Response

```text
quality alert
 ↓
stop promotion/new release
 ↓
identify release
 ↓
rollback application if needed
 ↓
identify affected partitions
 ↓
repair/replay
 ↓
quality validation
 ↓
resume
```

## Investigation questions

1. Which commit caused it?
2. Which image was deployed?
3. Which data partitions were affected?
4. Was the transformation idempotent?
5. Can data be replayed?
6. Which CI test should be added?

A production CI/CD system must include recovery, not only deployment.
