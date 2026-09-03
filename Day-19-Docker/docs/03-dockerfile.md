# 03 — Dockerfile Deep Dive

## Basic Dockerfile

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

## FROM

Selects the base image.

Consider:

- trust
- maintenance
- compatibility
- size
- security

## WORKDIR

```dockerfile
WORKDIR /app
```

Sets the working directory.

## COPY

```dockerfile
COPY requirements.txt .
COPY src ./src
```

Copies files from the build context.

## RUN

```dockerfile
RUN pip install --no-cache-dir -r requirements.txt
```

Runs during image construction.

## CMD

```dockerfile
CMD ["python", "src/main.py"]
```

Provides the default command.

## ENTRYPOINT

Example:

```dockerfile
ENTRYPOINT ["python"]
CMD ["src/main.py"]
```

Conceptually:

```text
ENTRYPOINT = primary executable
CMD        = default arguments
```

## EXPOSE

```dockerfile
EXPOSE 8080
```

Documents the intended container port.

It does not publish the port.

Publish it using:

```bash
docker run -p 8080:8080 app:1.0
```

## ENV

```dockerfile
ENV PYTHONUNBUFFERED=1
```

Defines environment configuration.

Do not use it to store secrets.

## ARG

```dockerfile
ARG BUILD_VERSION
```

Useful for build-time parameters.

## USER

```dockerfile
USER appuser
```

Runs the application as the specified user.

## .dockerignore

```text
.git
.venv
__pycache__
*.pyc
.env
logs/
raw-data/
```

This reduces build context and prevents accidental inclusion of unnecessary files.

## Multi-stage Builds

```dockerfile
FROM python:3.12-slim AS builder

WORKDIR /build

COPY requirements.txt .

RUN pip install     --prefix=/install     --no-cache-dir     -r requirements.txt


FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /install /usr/local
COPY src ./src

RUN useradd --create-home appuser
USER appuser

CMD ["python", "src/main.py"]
```

The runtime image does not need all build-time artifacts.

## Cache-Friendly Ordering

Prefer:

```dockerfile
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY src ./src
```

instead of copying all source before dependency installation.

## Automobile Example

```dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY src ./src
USER appuser
CMD ["python", "src/processor.py"]
```
