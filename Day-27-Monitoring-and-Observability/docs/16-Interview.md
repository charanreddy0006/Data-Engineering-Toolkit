# Interview Preparation

## Beginner

1. What is monitoring?
2. What is observability?
3. Metrics vs logs vs traces?
4. What is telemetry?
5. What is an SLI?
6. What is an SLO?
7. What is an SLA?
8. What is data freshness?
9. What is alert fatigue?
10. What is MTTR?

## Intermediate

1. How would you monitor an ETL pipeline?
2. How would you detect stale data?
3. How would you monitor Kafka lag?
4. How do lineage and observability work together?
5. What makes an alert actionable?
6. How do you monitor Spark?
7. How would you secure observability data?
8. How would you design a data-product SLO?

## Scenario

A pipeline is green but the dashboard is stale.

Answer systematically:
```text
Pipeline status
→ newest source data
→ freshness calculation
→ downstream dependencies
→ publication
→ cache
→ lineage
→ recent changes
```

## System Design

Start with consumer requirements and SLOs, then define signals, instrumentation,
collection, storage, dashboards, alerts, runbooks, retention, cost, and failure
modes.
