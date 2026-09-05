# Runners, Artifacts and Caches

## Runner

The compute environment that executes a job.

Runners can be hosted, self-hosted or ephemeral.

## Artifact

A generated output worth preserving.

Examples:

```text
Python wheel
Docker image
test report
coverage report
```

## Cache

Reusable data intended to speed up future runs.

Examples:

- package cache,
- dependency cache,
- Docker build cache.

## Important

```text
artifact ≠ cache
```

A Docker image in a registry is a release artifact. A package cache is only an optimization.
