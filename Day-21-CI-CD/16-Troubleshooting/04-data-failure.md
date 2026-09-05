# Data Failure During Deployment

Application failure:

```text
new image → crash
```

Data failure:

```text
new transformation → bad records
```

Rolling back the image does not automatically repair bad records.

## Recovery

1. Stop further bad processing.
2. Identify affected runs/partitions.
3. Preserve evidence.
4. Determine replay/repair method.
5. Repair idempotently.
6. Validate.
7. Resume.

Track:

```text
run_id
pipeline_version
source_partition
processed_at
```

These make incident analysis easier.
