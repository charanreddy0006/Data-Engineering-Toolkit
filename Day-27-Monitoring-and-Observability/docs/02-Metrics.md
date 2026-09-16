# Metrics

## Metric

A metric is a numerical measurement observed over time.

Examples:

```text
pipeline_duration_seconds
pipeline_failures_total
records_processed_total
kafka_consumer_lag
data_freshness_seconds
```

## Counter

Usually increases monotonically, such as total processed records.

## Gauge

Represents a current value, such as active workers or current lag.

## Histogram

Represents a distribution, useful for request/job duration.

## Labels

Labels add dimensions such as:

```text
service="telemetry"
environment="prod"
pipeline="vehicle_ingestion"
```

Avoid high-cardinality labels such as VIN or request IDs when they create huge
numbers of time series.

## Useful Data Metrics

| Metric | Purpose |
|---|---|
| throughput | traffic |
| duration | performance |
| failure rate | reliability |
| freshness | timeliness |
| rejected records | quality |
| storage growth | capacity |
