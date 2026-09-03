FROM python:3.12-slim AS builder

WORKDIR /build

COPY requirements.txt .

RUN pip install     --no-cache-dir     --prefix=/install     -r requirements.txt


FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY --from=builder /install /usr/local

COPY src ./src

RUN useradd     --create-home     --uid 10001     appuser     && chown -R appuser:appuser /app

USER appuser

CMD ["python", "-m", "src.main"]
