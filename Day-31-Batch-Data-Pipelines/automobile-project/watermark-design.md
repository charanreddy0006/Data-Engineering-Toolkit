# Watermark Design

## Control Fields

```text
pipeline_name
source_name
last_success_value
run_id
status
updated_at
```

## Rule

Advance a watermark only after:
1. extraction
2. transformation
3. target write
4. quality validation
5. reconciliation

have succeeded.

## Recovery

If a downstream write fails, retain the previous successful watermark and rerun the incomplete source window safely.
