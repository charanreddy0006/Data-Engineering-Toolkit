# 14 — Docker Performance and Optimization

## Why Size Matters

Large images increase:

- build time
- upload time
- download time
- storage
- deployment time

## Base Image

A compatible image such as:

```text
python:3.12-slim
```

may be preferable to a larger image.

Always test compatibility.

## Cache-Friendly Dockerfile

```dockerfile
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY src ./src
```

## Build Context

Use `.dockerignore`:

```text
.git
.venv
logs/
raw-data/
.env
__pycache__
```

## Avoid Large Datasets in Images

Bad:

```text
Image
 + 20 GB telemetry
```

Better:

```text
Image → code + dependencies
Object Storage → raw data
Database → curated data
```

## Multi-stage Builds

Use build stages to keep build-only artifacts out of the runtime image.

## Runtime

```bash
docker stats
```

Observe CPU and memory.

## Data Engineering Bottlenecks

A slow pipeline may actually be caused by:

- poor SQL
- missing indexes
- inefficient pandas operations
- excessive serialization
- network I/O
- poor partitioning
- excessive data movement

Docker cannot fix a poor algorithm.

## Optimization

```text
Measure
 ↓
Find bottleneck
 ↓
Change
 ↓
Measure
```

## Automobile Example

For millions of telemetry events, optimize the complete pipeline:

```text
Ingestion
+
Batching
+
Serialization
+
Network
+
Database
+
Indexes
+
Storage
```
