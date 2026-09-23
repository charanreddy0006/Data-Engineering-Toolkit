# 13. Checkpoints

A checkpoint records processing progress.

Examples:
- completed partition
- source offset
- last successful watermark
- batch status

## Example

```text
pipeline = service_daily
partition = 2026-09-23
status = SUCCESS
run_id = 20260923_0200
```

## Why?

After failure, the system can identify which work is complete and which must be retried.

Watermarks and checkpoints often work together:
- watermark = source boundary
- checkpoint = processing state
