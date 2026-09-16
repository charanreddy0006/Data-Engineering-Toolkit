# Comparisons

## Monitoring vs Observability

| Monitoring | Observability |
|---|---|
| Detect known conditions | Investigate unknown behavior |
| Thresholds/health checks | Rich correlated telemetry |
| Necessary | Builds on instrumentation |

## Metrics vs Logs vs Traces

| Signal | Main Question |
|---|---|
| Metrics | What is changing? |
| Logs | What happened? |
| Traces | Where did the operation spend time/fail? |
| Data quality | Is the data trustworthy? |

## SLI vs SLO vs SLA

| SLI | SLO | SLA |
|---|---|---|
| Measurement | Target | Formal commitment |
| Current behavior | Desired reliability | Business/contractual agreement |

## Threshold vs Anomaly

Thresholds work well for stable boundaries. Anomaly detection works well where normal
behavior varies. Mature systems can use both.
