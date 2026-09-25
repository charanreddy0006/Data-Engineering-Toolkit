# 24. Google Cloud Architecture

A common pattern:

```text
Sources
 ↓
Pub/Sub / Dataflow
 ↓
Cloud Storage
 ↓
BigQuery / Dataproc
 ↓
BI / ML
```

Supporting areas:
- IAM
- Cloud Monitoring
- Secret Manager

## Automobile
Vehicle events can enter Pub/Sub, be transformed by Dataflow and stored for enterprise analytics.
