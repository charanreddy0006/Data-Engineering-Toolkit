# 07 — Docker Networking

## Why Networking?

Services need to communicate:

```text
Python ETL
    |
    v
PostgreSQL
```

Docker provides virtual networks.

## Create

```bash
docker network create data-network
```

Run:

```bash
docker run -d   --name postgres   --network data-network   postgres:16
```

## Compose Networking

Given:

```yaml
services:
  postgres:
    image: postgres:16

  etl:
    build: ./etl
```

The ETL can generally reach PostgreSQL using:

```text
postgres
```

## localhost Trap

Inside the ETL container:

```text
localhost = ETL container
```

It does not mean PostgreSQL.

Correct:

```text
DB_HOST=postgres
DB_PORT=5432
```

## Host Port

```yaml
ports:
  - "5432:5432"
```

Then the host can use:

```text
localhost:5432
```

But another Compose service can use:

```text
postgres:5432
```

## Published vs Internal

A database used only by internal services often does not need a published port.

## DNS

Avoid hard-coded container IPs:

```text
172.20.0.5
```

Prefer:

```text
postgres
```

because service discovery handles changing container addresses.

## Inspect

```bash
docker network ls
docker network inspect <network>
```

## Automobile Architecture

```text
Telemetry API
 ↓
Ingestion
 ↓
Private Docker Network
 ↓
PostgreSQL
 ↓
Quality
```

Only expose services that require host/external access.
