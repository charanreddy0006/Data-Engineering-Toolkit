# Example 01 — Beginner Python Container

## Objective

Learn:

```text
Dockerfile
   ↓
Image
   ↓
Container
   ↓
Python transformation
```

## Build

```bash
docker build -t de-python-demo:1.0 .
```

## Run

```bash
docker run --rm de-python-demo:1.0
```

## Expected Behavior

The program processes a small vehicle telemetry dataset.

The container exits when the Python process finishes.

That is expected for a batch workload.

## Concepts

- base image
- dependency installation
- source copying
- non-root execution
- image build
- container lifecycle
- automobile telemetry
