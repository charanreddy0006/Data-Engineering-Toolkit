# Build Once, Promote Many

The preferred model is:

```text
source
 ↓
build
 ↓
test
 ↓
artifact
 ↓
dev
 ↓
staging
 ↓
production
```

Do not rebuild the application for every environment.

## Why?

A rebuild can change:

- dependency resolution,
- base image,
- build timestamp,
- generated files,
- compiler behavior.

Promoting one artifact gives stronger consistency.

## Data engineering

The tested ETL image should be the same image used by the production Kubernetes Job.
