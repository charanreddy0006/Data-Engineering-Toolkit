# CI-Friendly Dockerfile

```dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src ./src

RUN useradd --create-home appuser
USER appuser

CMD ["python", "-m", "src.main"]
```

## Cache-friendly order

Dependencies often change less frequently than source code.

Therefore:

```text
COPY requirements
install
COPY source
```

can improve build reuse.

## CI should verify

- build succeeds,
- tests pass,
- image starts,
- security policy passes.
