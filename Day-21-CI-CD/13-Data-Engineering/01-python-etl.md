# Python ETL CI/CD

Typical pipeline:

```text
PR
 ↓
lint
 ↓
unit tests
 ↓
integration tests
 ↓
build image
 ↓
scan
 ↓
registry
 ↓
Kubernetes Job/CronJob
```

## Test

Validate:

- parsing,
- transformations,
- error handling,
- database writes.

## Idempotency

A retry should not corrupt the destination.

Possible keys:

```text
source_partition + business_key
```

or another strategy appropriate to the sink.

## Release

Deploy the exact tested image.
