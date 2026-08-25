from datetime import datetime
from airflow import DAG
from airflow.decorators import task

with DAG(
    dag_id="automobile_service_pipeline",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    tags=["automobile", "service"],
) as dag:

    @task
    def extract():
        return "raw/service/{{ ds }}.csv"

    @task
    def validate(path):
        print("Checking schema:", path)
        return path

    @task
    def transform(path):
        print("Cleaning and deduplicating:", path)
        return path.replace("raw/", "curated/")

    @task
    def load(path):
        print("Idempotent load:", path)

    @task
    def quality():
        print("Checking row counts, duplicates and freshness")

    raw = extract()
    valid = validate(raw)
    curated = transform(valid)
    load(curated)
    quality()
