from pyspark.sql import SparkSession
from pyspark.sql import functions as F

spark = (
    SparkSession.builder
    .appName("ParquetPipeline")
    .master("local[*]")
    .getOrCreate()
)

events = spark.createDataFrame(
    [
        ("V001", "2026-08-28", 72),
        ("V002", "2026-08-28", 81),
        ("V003", "2026-08-29", 67),
    ],
    ["vehicle_id", "event_date", "speed"]
)

events = events.withColumn(
    "event_date",
    F.to_date("event_date")
)

(
    events.write
    .mode("overwrite")
    .partitionBy("event_date")
    .parquet("output/vehicle_events")
)

loaded = spark.read.parquet("output/vehicle_events")
loaded.printSchema()
loaded.show()

spark.stop()
