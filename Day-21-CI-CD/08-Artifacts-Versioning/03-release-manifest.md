# Release Manifest

A useful release record can contain:

```yaml
release: 1.8.0
commit: abc123
image: company/vehicle-etl:git-abc123
environment: production
deployed_at: "2026-09-05T18:00:00Z"
```

## Why?

During an incident you can answer:

- What is running?
- Which commit produced it?
- Which artifact was tested?
- When was it deployed?

## Data engineering addition

Also record:

```text
pipeline_version
schema_version
data_contract_version
run_id
```

when relevant.
