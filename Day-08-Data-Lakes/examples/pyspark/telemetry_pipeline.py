from pyspark.sql import SparkSession
from pyspark.sql.functions import col, to_timestamp, avg

spark = (
    SparkSession.builder
    .appName("AutomotiveDataLake")
    .getOrCreate()
)

raw = (
    spark.read
    .option("header", True)
    .csv("data/raw/telemetry.csv")
)

clean = (
    raw
    .withColumn("speed", col("speed").cast("double"))
    .withColumn("battery", col("battery").cast("double"))
    .withColumn("timestamp", to_timestamp("timestamp"))
    .filter(col("vehicle_id").isNotNull())
    .filter(col("timestamp").isNotNull())
    .filter(col("speed") >= 0)
    .filter(col("battery").between(0, 100))
    .dropDuplicates(["vehicle_id", "timestamp"])
)

summary = (
    clean
    .groupBy("vehicle_id")
    .agg(
        avg("speed").alias("average_speed"),
        avg("battery").alias("average_battery"),
    )
)

summary.show(truncate=False)

(
    clean.write
    .mode("overwrite")
    .partitionBy("vehicle_id")
    .parquet("data/processed/telemetry")
)

(
    summary.write
    .mode("overwrite")
    .parquet("data/curated/vehicle_summary")
)

spark.stop()
