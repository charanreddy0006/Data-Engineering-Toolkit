# 18 — Intermediate Data Lake Example

## Scenario

Process multiple vehicle telemetry files, remove duplicates, validate records,
derive metrics, and write partitioned Parquet.

## Pipeline

```text
CSV Files
   |
   v
Read
   |
   v
Union
   |
   v
Validate
   |
   v
Deduplicate
   |
   v
Transform
   |
   v
Partitioned Parquet
```

## PySpark Example

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, to_timestamp, year, month, dayofmonth

spark = (
    SparkSession.builder
    .appName("VehicleLake")
    .getOrCreate()
)

df = spark.read.option("header", True).csv(
    "data/raw/telemetry/*.csv"
)

df = (
    df
    .withColumn("speed", col("speed").cast("double"))
    .withColumn("battery", col("battery").cast("double"))
    .withColumn("timestamp", to_timestamp("timestamp"))
)

clean = df.filter(
    (col("speed") >= 0) &
    col("vehicle_id").isNotNull() &
    col("timestamp").isNotNull() &
    col("battery").between(0, 100)
)

clean = clean.dropDuplicates(["vehicle_id", "timestamp"])

clean = (
    clean
    .withColumn("year", year("timestamp"))
    .withColumn("month", month("timestamp"))
    .withColumn("day", dayofmonth("timestamp"))
)

(
    clean.write
    .mode("append")
    .partitionBy("year", "month", "day")
    .parquet("data/processed/telemetry")
)

spark.stop()
```

## Why This Is Better

The example introduces distributed processing, validation, deduplication,
typed columns, and partitioned analytical storage.
