# Monitoring and Observability Fundamentals

## Monitoring

Monitoring measures known system conditions and detects expected failure modes.

Examples:
- CPU usage
- pipeline failures
- Kafka lag
- database connections
- data freshness

## Observability

Observability is the ability to understand internal system behavior from externally
available telemetry.

```text
Monitoring → Detect a problem
Observability → Investigate why
Response → Mitigate
Engineering → Improve
```

## Telemetry

Telemetry is data emitted or collected about system behavior.

Common signals:
- metrics
- logs
- traces
- events
- profiles

## Golden Signals

Latency, traffic, errors, and saturation provide a useful high-level service view.

For data platforms, add:
- freshness
- correctness
- volume
- quality

## Important

A pipeline can be technically "up" while its output is stale or wrong. Data
observability therefore extends beyond infrastructure health.
