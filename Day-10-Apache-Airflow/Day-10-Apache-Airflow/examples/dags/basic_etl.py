from datetime import datetime
from airflow import DAG
from airflow.decorators import task

with DAG(
    dag_id="day10_basic_etl",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    tags=["day10", "etl"],
) as dag:

    @task
    def extract():
        return {"path": "raw/service/2026-08-25.csv", "rows": 5000}

    @task
    def validate(metadata):
        assert metadata["rows"] >= 0
        return metadata

    @task
    def transform(metadata):
        return {
            "path": metadata["path"].replace("raw/", "curated/"),
            "rows": metadata["rows"],
        }

    @task
    def load(metadata):
        print("Publishing:", metadata)

    load(transform(validate(extract())))
