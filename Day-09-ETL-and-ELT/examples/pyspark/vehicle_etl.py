from pyspark.sql import SparkSession
from pyspark.sql.functions import (
    avg,
    col,
    count,
    max,
    sum,
    to_date,
    trim,
    upper,
)

spark = (
    SparkSession.builder
    .appName("Day09VehicleETL")
    .getOrCreate()
)

source = (
    spark.read
    .option("header", True)
    .option("inferSchema", True)
    .csv("examples/data/service_raw.csv")
)

clean = (
    source
    .withColumn(
        "vehicle_id",
        upper(trim(col("vehicle_id")))
    )
    .withColumn(
        "service_type",
        upper(trim(col("service_type")))
    )
    .withColumn(
        "service_date",
        to_date(col("service_date"))
    )
    .withColumn(
        "service_cost",
        col("service_cost").cast("double")
    )
    .filter(col("service_id").isNotNull())
    .filter(col("vehicle_id").isNotNull())
    .filter(col("service_date").isNotNull())
    .filter(col("service_cost") >= 0)
)

unique = clean.dropDuplicates(
    ["service_id"]
)

summary = (
    unique.groupBy("vehicle_id")
    .agg(
        count("*").alias("service_count"),
        sum("service_cost").alias("total_service_cost"),
        avg("service_cost").alias("average_service_cost"),
        max("service_date").alias("last_service_date"),
    )
)

print("SOURCE")
source.show()

print("CURATED")
unique.show()

print("SUMMARY")
summary.show()

unique.write.mode("overwrite").parquet(
    "examples/data/processed_service"
)

summary.write.mode("overwrite").parquet(
    "examples/data/vehicle_service_summary"
)

spark.stop()
