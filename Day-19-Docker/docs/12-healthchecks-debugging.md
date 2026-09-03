# 12 — Health Checks and Debugging

## Started vs Ready

```text
Container running
       ≠
Service ready
```

For example, PostgreSQL may need additional time after its process starts.

## Health Check

```yaml
healthcheck:
  test: ["CMD-SHELL", "pg_isready -U data_engineer -d automotive"]
  interval: 5s
  timeout: 3s
  retries: 10
```

## Status

```bash
docker compose ps
```

## Logs

```bash
docker compose logs
docker compose logs postgres
docker compose logs etl
```

Follow:

```bash
docker compose logs -f etl
```

## Database Connection Failure

Check:

```text
1. PostgreSQL running?
2. PostgreSQL healthy?
3. Correct hostname?
4. Correct port?
5. Correct credentials?
6. Database exists?
7. Same network?
8. Service accepting connections?
```

## Restart Loop

```bash
docker ps -a
docker logs <container>
docker inspect <container>
```

Look for:

- invalid command
- missing environment
- missing file
- permissions
- application exception
- dependency failure

## Port Conflict

If host port 5432 is occupied:

```yaml
ports:
  - "5433:5432"
```

Host:

```text
localhost:5433
```

Internal Compose service:

```text
postgres:5432
```

## Missing Data

Check:

```bash
docker volume ls
docker volume inspect <volume>
```

Ask:

```text
Was volume mounted?
Was it deleted?
Did database initialization run?
```

## Debugging Model

```text
Build
 ↓
Startup
 ↓
Application
 ↓
Network
 ↓
Persistence
 ↓
Data
```

Identify the layer before changing configuration.
