# 35. Cloud Real-Time Architecture

```text
Devices / Apps
      ↓
Managed Event Ingestion
      ↓
Streaming Platform
      ↓
Stream Processor
      ↓
Real-Time Store / Data Lake
      ↓
Dashboard / ML / Alerts
```

## Supporting services
- event broker
- stream processor
- object storage
- warehouse
- IAM
- monitoring

## Cost drivers
event volume, retention, compute, network, serving storage and monitoring.
