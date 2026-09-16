# Capacity and Cost Observability

## Capacity Signals

CPU, memory, storage, network, queue depth, Kafka lag, worker utilization, query
concurrency, and processing throughput.

## Capacity Planning

```text
Historical Trend → Growth Rate → Forecast → Capacity Decision
```

Do not wait for saturation.

## Cost Observability

Track cost by:
- pipeline
- data product
- dataset
- compute workload
- storage
- team/domain

For high-volume telemetry, unnecessary copies and uncontrolled retention can create
large costs.

Reliability and observability controls should not be removed blindly to save cost.
