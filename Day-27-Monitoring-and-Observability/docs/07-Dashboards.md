# Dashboards

## Dashboard Hierarchy

```text
Overview → Service → Component → Detailed Investigation
```

## Pipeline Dashboard

Show:
- success rate
- duration
- throughput
- freshness
- retries
- rejected records
- last successful run
- dependency health

## Kafka Dashboard

Show:
- consumer lag
- records/sec
- bytes/sec
- broker health
- request latency
- errors
- replication health

## Automobile Dashboard

```text
Telemetry Throughput
Kafka Lag
Gateway Errors
Processing Latency
Newest Event Time
Invalid Telemetry %
Duplicate %
EV Signal Quality
Data Product SLO
```

Do not build dashboards full of charts without an operational question behind each
panel.
