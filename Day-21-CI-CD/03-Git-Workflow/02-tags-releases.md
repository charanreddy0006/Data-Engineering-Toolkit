# Tags and Releases

A release can be represented by a Git tag:

```bash
git tag v1.4.0
git push origin v1.4.0
```

## Why tags?

A tag provides a stable reference to a source revision.

## Traceability

```text
release 1.4.0
 ↓
commit abc123
 ↓
image company/telemetry:1.4.0
 ↓
production
```

## Build once

Prefer:

```text
build once → test → promote same artifact
```

instead of rebuilding independently for dev, staging and production.

Different builds can introduce differences.
