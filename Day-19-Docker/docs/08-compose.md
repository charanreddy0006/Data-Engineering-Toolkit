# 08 — Docker Compose

## What Is Compose?

Compose defines multi-container applications declaratively.

It can define:

- services
- networks
- volumes
- environment
- health checks
- dependencies
- ports
- profiles

## Example

```yaml
services:
  postgres:
    image: postgres:16

  etl:
    build: ./etl
```

## Commands

```bash
docker compose up
docker compose up -d
docker compose up --build
docker compose ps
docker compose logs
docker compose logs -f etl
docker compose exec postgres sh
docker compose down
```

## Health Check

```yaml
healthcheck:
  test: ["CMD-SHELL", "pg_isready -U data_engineer -d automotive"]
  interval: 5s
  timeout: 3s
  retries: 10
```

## depends_on

```yaml
depends_on:
  postgres:
    condition: service_healthy
```

This helps coordinate startup based on health status.

However, applications should still handle transient failures.

## Why?

```text
Container started
       ≠
Application ready
```

## Environment

```yaml
environment:
  DB_HOST: postgres
  DB_PORT: "5432"
```

## Profiles

```yaml
adminer:
  image: adminer:4
  profiles:
    - tools
```

Run:

```bash
docker compose --profile tools up
```

## Data Engineering Stack

```text
Compose
 |
 +-- PostgreSQL
 +-- Python ETL
 +-- Quality
 +-- optional tools
```

## Appropriate Uses

Compose is excellent for:

- local development
- integration testing
- demos
- learning
- small multi-service environments

Large production environments may require dedicated orchestration or managed services.
