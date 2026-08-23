# 15 — Installation and Setup

## Python

```powershell
python --version
python -m venv .venv
.venv\Scripts\activate
python -m pip install --upgrade pip
pip install pandas pyarrow pyspark
```

## Verify

```powershell
python -c "import pandas, pyarrow; print('Lake environment ready')"
```

## Docker

Useful services for local experiments include:

```text
MinIO
Kafka
Spark
PostgreSQL
```

## Suggested Learning Environment

```text
Windows
 |
 +--> Python
 +--> VS Code
 +--> Docker Desktop
 +--> Git
```

Cloud services can be introduced after understanding local data-lake concepts.

## Important

Do not begin with expensive cloud infrastructure before understanding storage,
partitions, formats, ingestion, processing, and governance.
