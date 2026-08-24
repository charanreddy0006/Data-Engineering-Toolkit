# Day 09 Run Guide

## Python

```powershell
python -m venv .venv
.venv\Scripts\activate
pip install -r examples/requirements.txt
```

Run the complete local ETL:

```powershell
python examples/python/etl_pipeline.py
```

Run incremental loading:

```powershell
python examples/python/incremental_load.py
```

Run data quality:

```powershell
python examples/python/data_quality.py
```

Run idempotency:

```powershell
python examples/python/idempotent_load.py
```

## SQL

Open:

```text
examples/sql/etl_transformations.sql
```

Run the statements after creating the required source table.

## PySpark

```powershell
python examples/pyspark/vehicle_etl.py
```

## Recommended learning sequence

1. Read `README.md`.
2. Read folders 01–09.
3. Run the Python ETL.
4. Inspect the CSV output.
5. Study incremental loading.
6. Study validation and idempotency.
7. Read the SQL transformations.
8. Compare SQL with PySpark.
9. Study folders 10–49.
10. Complete the automobile mini project.

## Expected concepts

After completing Day 09 you should be able to explain:

- ETL
- ELT
- extraction
- transformation
- loading
- batch processing
- incremental processing
- CDC
- validation
- cleansing
- deduplication
- idempotency
- retries
- lineage
- data quality
- orchestration
- partitioning
- monitoring
- security
- governance
