# 36 — Data Lake Monitoring

## Pipeline Metrics

Track:

- Success/failure
- Duration
- Throughput
- Retry count
- Error count

## Data Metrics

Track:

- Row count
- File count
- Data volume
- Null percentage
- Duplicate percentage
- Invalid records

## Freshness

A dataset expected every hour should trigger an alert when it has not updated
within the acceptable freshness window.

## Streaming

Monitor:

- Consumer lag
- Event throughput
- Processing latency
- Checkpoint health

## Storage

Monitor:

- Total size
- Object count
- Storage tier
- Cost

## Principle

Monitor both the pipeline and the data it produces.
