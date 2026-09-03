# Example 03 — Production-Oriented Pattern

This combines:

- multi-stage builds
- non-root execution
- environment configuration
- PostgreSQL health checks
- Compose dependency conditions
- bounded retry logic
- structured logging
- persistent storage

## Run

```bash
docker compose up --build
```

## Logs

```bash
docker compose logs -f etl
```

## Architecture

```mermaid
flowchart LR
    C[Compose] --> E[ETL]
    C --> P[(PostgreSQL)]
    P --> V[(Named Volume)]
    E -->|postgres:5432| P
```

## Production Improvements

- real secret management
- managed PostgreSQL where appropriate
- image scanning
- dependency scanning
- tests
- metrics
- tracing
- CI/CD
- immutable release artifacts
