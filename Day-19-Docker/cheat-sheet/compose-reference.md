# Docker Compose Quick Reference

## Service

```yaml
services:
  app:
    image: my-app:1.0
```

## Build

```yaml
services:
  app:
    build: ./app
```

## Environment

```yaml
environment:
  APP_ENV: development
```

## Port

```yaml
ports:
  - "8080:8080"
```

## Volume

```yaml
volumes:
  - app_data:/data
```

## Health

```yaml
healthcheck:
  test: ["CMD-SHELL", "health-command"]
  interval: 5s
  timeout: 3s
  retries: 10
```

## Dependency

```yaml
depends_on:
  database:
    condition: service_healthy
```

## Commands

```bash
docker compose up
docker compose up --build
docker compose ps
docker compose logs
docker compose exec app sh
docker compose down
docker compose down -v
```
