# Matrix, Artifacts and Cache

## Matrix

Test multiple supported versions:

```yaml
strategy:
  matrix:
    python: ["3.11", "3.12", "3.13"]
```

## Artifacts

Preserve outputs such as:

```text
coverage.xml
test reports
logs
```

## Cache

Cache dependencies to reduce repeated download/build time.

Do not treat cache as the authoritative release artifact.

## Data engineering

Test an ETL library across supported Python versions, then build the production image only after required checks pass.
