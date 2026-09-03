FROM python:3.12-slim

WORKDIR /app

COPY automobile-project/quality/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY automobile-project/quality/src ./src

RUN useradd --create-home appuser

USER appuser

CMD ["python", "src/check_quality.py"]
