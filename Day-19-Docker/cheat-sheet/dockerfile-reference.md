# Dockerfile Quick Reference

| Instruction | Purpose |
|---|---|
| FROM | Base image |
| WORKDIR | Working directory |
| COPY | Copy files |
| ADD | Extended add/copy behavior |
| RUN | Build command |
| ENV | Environment variable |
| ARG | Build-time argument |
| USER | Runtime user |
| EXPOSE | Documents intended port |
| CMD | Default command |
| ENTRYPOINT | Main executable |

## Standard Python

```dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src ./src

RUN useradd --create-home appuser
USER appuser

CMD ["python", "src/main.py"]
```

## Multi-stage

```dockerfile
FROM python:3.12-slim AS builder

COPY requirements.txt .

RUN pip install     --prefix=/install     -r requirements.txt


FROM python:3.12-slim

COPY --from=builder /install /usr/local
COPY src ./src
```
