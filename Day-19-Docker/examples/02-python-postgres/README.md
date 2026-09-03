# Example 02 — Python ETL + PostgreSQL

## Architecture

```text
Python ETL Container
        |
        | Docker Compose network
        v
PostgreSQL Container
        |
        v
Named Volume
```

## Start

```bash
docker compose up --build
```

## Check

```bash
docker compose ps
docker compose logs etl
```

## Query

```bash
docker compose exec postgres psql   -U data_engineer   -d automotive   -c "SELECT * FROM vehicle_telemetry;"
```

## Stop

```bash
docker compose down
```

## Reset Learning Database

```bash
docker compose down -v
docker compose up --build
```

## Important

The ETL uses:

```text
postgres:5432
```

not:

```text
localhost:5432
```

because `postgres` is the Compose service name.
