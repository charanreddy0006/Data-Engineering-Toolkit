from datetime import datetime
from airflow import DAG
from airflow.operators.empty import EmptyOperator

with DAG(
    dag_id="daily_service_pipeline",
    start_date=datetime(2026, 1, 1),
    schedule="0 2 * * *",
    catchup=False,
) as dag:
    extract = EmptyOperator(task_id="extract")
    validate = EmptyOperator(task_id="validate")
    transform = EmptyOperator(task_id="transform")
    reconcile = EmptyOperator(task_id="reconcile")
    publish = EmptyOperator(task_id="publish")

    extract >> validate >> transform >> reconcile >> publish
