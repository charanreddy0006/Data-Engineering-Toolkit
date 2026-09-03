# Automobile Project Runbook

## Start

```bash
cd automobile-project
docker compose up --build
```

## Status

```bash
docker compose ps
```

## Logs

```bash
docker compose logs etl
docker compose logs quality
docker compose logs postgres
```

## Query

```bash
docker compose exec postgres psql   -U data_engineer   -d automotive   -c "SELECT COUNT(*) FROM vehicle_telemetry;"
```

## Analytics

Use:

```text
analytics.sql
```

## Reset

```bash
docker compose down -v
docker compose up --build
```

## Duplicate Data

Running the simple ETL repeatedly can insert duplicates.

Production improvement:

```text
event_id
 ↓
unique constraint
 ↓
staging
 ↓
upsert / merge
```
