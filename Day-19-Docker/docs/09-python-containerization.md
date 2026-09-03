# 09 — Python Containerization

## Structure

```text
etl/
├── Dockerfile
├── requirements.txt
├── .dockerignore
└── src/
    ├── extract.py
    ├── transform.py
    ├── load.py
    └── main.py
```

## Dockerfile

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

## Batch ETL

```text
Start
 ↓
Extract
 ↓
Transform
 ↓
Load
 ↓
Exit
```

The container stopping after successful completion is normal.

## Configuration

```python
import os

db_host = os.environ["DB_HOST"]
```

Avoid hard-coding environment-specific infrastructure.

## Logging

```python
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

logger.info("ETL started")
```

Prefer stdout/stderr so container platforms can collect logs.

## Idempotency

A retry must not accidentally create duplicate business data.

Possible techniques:

- unique event IDs
- staging tables
- upsert
- merge
- deduplication
- batch IDs

## Retryability

```text
Temporary DB error → retry
Invalid schema → fail
Bad business data → quarantine
Authentication error → alert/fail
```

## Automobile Example

```text
Telemetry CSV
 ↓
Python container
 ↓
validate
 ↓
transform
 ↓
load
 ↓
log batch result
```
