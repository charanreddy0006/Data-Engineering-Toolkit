# 10 — PostgreSQL with Docker

## Run

```bash
docker run -d   --name automotive-postgres   -e POSTGRES_DB=automotive   -e POSTGRES_USER=data_engineer   -e POSTGRES_PASSWORD=dev_password   -p 5432:5432   -v automotive_pgdata:/var/lib/postgresql/data   postgres:16
```

These credentials are for local learning only.

## Host Connection

```bash
psql   -h localhost   -p 5432   -U data_engineer   -d automotive
```

## Container Connection

```bash
docker exec -it automotive-postgres   psql -U data_engineer -d automotive
```

## Compose

```yaml
services:
  postgres:
    image: postgres:16
    environment:
      POSTGRES_DB: automotive
      POSTGRES_USER: data_engineer
      POSTGRES_PASSWORD: dev_password
    volumes:
      - automotive_pgdata:/var/lib/postgresql/data
```

## Initialization

The official PostgreSQL image supports initialization scripts under:

```text
/docker-entrypoint-initdb.d/
```

These are intended for initialization of a new data directory.

They are not a replacement for a complete database migration strategy.

## Health

```yaml
healthcheck:
  test: ["CMD-SHELL", "pg_isready -U data_engineer -d automotive"]
```

## Development Architecture

```text
Python ETL
   |
   | postgres:5432
   v
PostgreSQL
   |
   v
Named Volume
```

## Production

Consider:

- backups
- recovery
- access control
- monitoring
- encryption
- secret management
- high availability
- managed PostgreSQL

## Automobile Entities

A learning database can contain:

```text
vehicles
customers
dealers
service_events
telemetry
charging_events
fault_events
```
