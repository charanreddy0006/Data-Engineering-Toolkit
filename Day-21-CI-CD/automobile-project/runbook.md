# Automobile Release Runbook

## Before release

```bash
pytest -q
docker build -t company/vehicle-platform:git-SHA .
```

Run CI quality and security checks.

## Staging

```text
deploy
 ↓
smoke test
 ↓
schema compatibility
 ↓
data-quality gate
```

## Production

Promote the exact tested artifact.

## Incident

```text
alert
 ↓
stop promotion
 ↓
identify commit/image
 ↓
rollback application if needed
 ↓
identify affected data
 ↓
repair/replay
 ↓
validate
```

Application rollback and data repair are separate operations.
