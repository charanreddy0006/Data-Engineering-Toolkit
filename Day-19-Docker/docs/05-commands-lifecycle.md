# 05 — Commands and Container Lifecycle

## Version

```bash
docker --version
docker info
docker compose version
```

## Images

```bash
docker images
docker pull python:3.12-slim
docker image inspect python:3.12-slim
docker rmi <image>
```

## Build

```bash
docker build -t telemetry-etl:1.0 .
```

## Run

```bash
docker run telemetry-etl:1.0
docker run --rm telemetry-etl:1.0
docker run -d --name telemetry-etl telemetry-etl:1.0
```

## Containers

```bash
docker ps
docker ps -a
docker start telemetry-etl
docker stop telemetry-etl
docker restart telemetry-etl
docker rm telemetry-etl
```

## Logs

```bash
docker logs telemetry-etl
docker logs -f telemetry-etl
```

## Execute

```bash
docker exec -it telemetry-etl sh
```

This starts a new process inside the container.

## Inspect

```bash
docker inspect telemetry-etl
```

Useful for:

- environment
- mounts
- networks
- state
- configuration

## Ports

```bash
docker run -d   --name web   -p 8080:80   nginx
```

Meaning:

```text
Host 8080 → Container 80
```

## Environment

```bash
docker run --rm   -e APP_ENV=development   telemetry-etl:1.0
```

## Lifecycle

```text
Created
  ↓
Running
  ↓
Stopped
  ↓
Removed
```

## Stop vs Kill

```bash
docker stop app
```

allows graceful shutdown.

```bash
docker kill app
```

terminates more aggressively.

## Monitoring

```bash
docker stats
```

## Cleanup

```bash
docker container prune
docker image prune
docker volume prune
```

Use cleanup commands carefully.

## Batch Jobs

A batch ETL can finish:

```text
Extract
 ↓
Transform
 ↓
Load
 ↓
Exit 0
```

An exited batch container is not automatically a failure.
