# 04 — Layers and Build Cache

## Layers

Docker image construction can be viewed as a sequence of layers.

```dockerfile
FROM python:3.12-slim
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src ./src
```

Conceptually:

```text
Layer 1 → Python base
Layer 2 → requirements.txt
Layer 3 → installed dependencies
Layer 4 → source code
```

## Why Cache Matters

Suppose source code changes but dependencies do not.

With good ordering:

```text
Base          → cached
Dependencies  → cached
Source        → rebuilt
```

With poor ordering, dependency installation may be repeated unnecessarily.

## Poor Pattern

```dockerfile
COPY . .
RUN pip install -r requirements.txt
```

## Better

```dockerfile
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY src ./src
```

## Build Context

The final argument:

```bash
docker build -t app:1.0 .
```

means `.` is the build context.

A repository containing:

```text
.git
.venv
logs
20 GB raw-data
src
```

should not send all of that to the builder.

Use `.dockerignore`.

## BuildKit

Modern Docker builds use BuildKit technology and support advanced caching/build features.

Check:

```bash
docker buildx version
```

## Data Engineering Example

Suppose an ETL uses:

```text
pandas
numpy
pyarrow
psycopg
```

and source changes daily.

Dependency layers should be reusable whenever possible.

## Optimization Principle

```text
Measure
 ↓
Inspect
 ↓
Change
 ↓
Measure again
```

Do not optimize image layers without measuring build time and resulting image size.
