from datetime import datetime
from airflow import DAG
from airflow.decorators import task

with DAG(
    dag_id="day10_dynamic_mapping",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
) as dag:

    @task
    def partitions():
        return ["india", "europe", "usa"]

    @task
    def process(region):
        print("Processing region:", region)

    process.expand(region=partitions())
