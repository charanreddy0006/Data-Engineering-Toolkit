from pyspark.sql import SparkSession

spark = (
    SparkSession.builder
    .appName("FileFormats")
    .getOrCreate()
)

vehicles = (
    spark.read
    .option("header", True)
    .csv("vehicles.csv")
)

telemetry = spark.read.json("telemetry.jsonl")

telemetry.select(
    "vehicle_id",
    "event_time",
    "battery_soc",
).show()

(
    vehicles.write
    .mode("overwrite")
    .parquet("output/vehicles")
)

(
    telemetry.write
    .mode("overwrite")
    .partitionBy("vehicle_id")
    .parquet("output/telemetry")
)

spark.stop()
