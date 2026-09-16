# Automotive Telemetry Incident Runbook

## Stale Data

1. Check product freshness.
2. Check newest event timestamp.
3. Check gateway traffic.
4. Check Kafka consumer lag.
5. Check processing latency.
6. Check storage/write errors.
7. Check publication status.
8. Check recent deployments.
9. Use lineage to identify downstream impact.

## Branching

```text
No incoming data → source/gateway
Kafka lag → consumer/partition/capacity
Processing slow → compute/downstream
Storage failure → lakehouse/database
Published stale → publication/cache
```

## Recovery

Confirm fresh events flow, quality checks pass, product is republished, and consumers
recover before closing the incident.
