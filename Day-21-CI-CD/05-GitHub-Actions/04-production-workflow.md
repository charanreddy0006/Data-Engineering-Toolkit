# Production GitHub Actions Design

A robust flow:

```text
PR
 ↓
lint + unit + SQL + schema tests
 ↓
merge
 ↓
build image
 ↓
scan
 ↓
push immutable image
 ↓
staging
 ↓
smoke/data-quality
 ↓
approval/policy
 ↓
production
```

## Build once

Use an immutable identifier such as:

```text
company/telemetry:git-abc123
```

Do not rebuild during production deployment.

## Rollback metadata

Record:

- source commit,
- artifact,
- deployment time,
- environment,
- previous version.
