FROM python:3.12-slim

WORKDIR /app

COPY automobile-project/etl/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY automobile-project/etl/src ./src
COPY automobile-project/data ./data

RUN useradd --create-home appuser

USER appuser

CMD ["python", "src/ingest.py"]
