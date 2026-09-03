# 06 — Volumes and Persistence

## Why Volumes?

Containers are replaceable.

Databases are stateful.

Therefore persistent database storage should be separate from the disposable container lifecycle.

## Named Volume

```bash
docker volume create automotive_data
```

Run:

```bash
docker run -d   --name postgres   -e POSTGRES_PASSWORD=dev_password   -v automotive_data:/var/lib/postgresql/data   postgres:16
```

## Inspect

```bash
docker volume ls
docker volume inspect automotive_data
```

## Without a Volume

```text
PostgreSQL
 ↓
Container writable layer
 ↓
Container deleted
 ↓
Data may be lost
```

## With a Volume

```text
PostgreSQL
 ↓
Named Volume
 ↓
Container deleted
 ↓
Volume remains
 ↓
New PostgreSQL container
```

## Bind Mount

```yaml
volumes:
  - ./src:/app/src
```

Useful for local source development.

## Named Volume

```yaml
volumes:
  - postgres_data:/var/lib/postgresql/data
```

Common for database persistence.

## Comparison

| | Bind Mount | Named Volume |
|---|---|---|
| Host path | Explicit | Docker-managed |
| Local source development | Excellent | Less convenient |
| Database persistence | Possible | Common |
| Portability | Lower | Higher |

## Compose

```yaml
volumes:
  postgres_data:

services:
  postgres:
    image: postgres:16
    volumes:
      - postgres_data:/var/lib/postgresql/data
```

## Dangerous Reset

```bash
docker compose down -v
```

This can remove named volumes associated with the Compose application.

Use it only when resetting disposable learning data.

## Automobile Example

```text
ETL container replaced
       ↓
PostgreSQL recreated
       ↓
Same persistent volume
       ↓
Telemetry remains
```
