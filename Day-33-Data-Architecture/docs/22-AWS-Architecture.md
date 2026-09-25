# 22. AWS Architecture

One possible AWS pattern:

```text
Sources
 ↓
Kinesis / MSK / Glue
 ↓
Amazon S3
 ↓
Glue / EMR / Athena
 ↓
Redshift / Lakehouse
 ↓
BI / ML
```

Supporting services can include:
- IAM
- CloudWatch
- KMS
- Lake Formation

## Automobile
Connected events can enter a managed streaming platform, land in S3 and be transformed for fleet BI.

Exact service choice should follow latency, scale, existing skills and cost.
