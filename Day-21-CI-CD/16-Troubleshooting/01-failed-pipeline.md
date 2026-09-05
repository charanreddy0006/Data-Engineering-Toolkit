# Failed CI Pipeline

## Debug order

```text
workflow
 ↓
job
 ↓
step
 ↓
first meaningful error
```

Reproduce locally:

```bash
pytest -q
docker build -t local:test .
```

Compare:

- runtime versions,
- dependencies,
- environment,
- working directory,
- credentials.

Do not hide deterministic failures by adding retries.
