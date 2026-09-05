# Airflow CI/CD

CI should test:

- DAG import,
- Python logic,
- task configuration,
- dependencies,
- scheduling assumptions.

Flow:

```text
lint
 ↓
unit tests
 ↓
DAG import
 ↓
integration
 ↓
build
 ↓
deploy
```

## Important

A deployment can change retry behavior and cause repeated processing.

Design:

- task idempotency,
- backfill behavior,
- retry policy,
- migration compatibility.

A successful DAG import is not proof of end-to-end data correctness.
