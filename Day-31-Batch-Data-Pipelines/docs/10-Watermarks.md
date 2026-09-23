# 10. Watermarks

A watermark represents the boundary of successfully processed source data.

Example:

```text
last_success = 2026-09-23T00:00:00Z
```

Next extraction:

```sql
WHERE updated_at > :last_success
```

## Control table

```text
pipeline_name
source_name
last_success_value
run_id
status
updated_at
```

## Important rule

Advance the watermark only after the output and required validation have succeeded.

## Automobile

If target loading fails, keep the previous watermark and safely rerun the incomplete window.
