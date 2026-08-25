from datetime import datetime, timedelta
from airflow import DAG
from airflow.decorators import task

with DAG(
    dag_id="day10_retry_example",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    default_args={
        "retries": 3,
        "retry_delay": timedelta(minutes=2),
    },
) as dag:

    @task
    def process():
        print("Process transiently failing external work here")

    process()
