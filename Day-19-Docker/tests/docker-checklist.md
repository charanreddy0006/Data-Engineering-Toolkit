# Docker Testing Checklist

## Build

```bash
docker build -t test-image:1.0 .
```

Verify:

- build succeeds
- expected files exist
- no credentials included

## Runtime

```bash
docker run --rm test-image:1.0
```

Verify:

- command runs
- expected exit code
- useful logs

## Compose

```bash
docker compose up --build
docker compose ps
docker compose logs
```

Verify:

- services start
- health checks pass
- network works
- database is reachable
- volume persists

## Data

Verify:

- tables exist
- expected row count
- constraints work
- quality checks work
- duplicate behavior is understood

## Security

Verify:

- no secrets committed
- non-root user
- required ports only
- image scanning
- dependency scanning

## CI

```text
Lint
 ↓
Unit Tests
 ↓
Integration Tests
 ↓
Docker Build
 ↓
Security Scan
 ↓
Publish
```
