# PySpark Examples

## Install

```powershell
pip install pyspark
```

## Run

```powershell
python telemetry_pipeline.py
```

The pipeline reads raw CSV telemetry, applies validation, removes duplicates,
writes processed Parquet, and creates a vehicle-level summary.

## Production Extensions

- Incremental processing
- Checkpointing
- Schema validation
- Data-quality framework
- Object storage
- Iceberg / Delta / Hudi
- Orchestration
