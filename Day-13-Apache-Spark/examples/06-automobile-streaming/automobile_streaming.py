from pyspark.sql import SparkSession
from pyspark.sql import functions as F

spark = (
    SparkSession.builder
    .appName("AutomobileStreaming")
    .master("local[*]")
    .getOrCreate()
)

events = (
    spark.readStream
    .format("rate")
    .option("rowsPerSecond", 5)
    .load()
)

telemetry = events.select(
    F.concat(
        F.lit("V"),
        (F.col("value") % 5 + 1)
    ).alias("vehicle_id"),
    F.col("timestamp").alias("event_time"),
    (F.col("value") % 120).alias("speed")
)

query = (
    telemetry.writeStream
    .format("console")
    .outputMode("append")
    .option("truncate", "false")
    .option(
        "checkpointLocation",
        "checkpoints/automobile_stream"
    )
    .start()
)

query.awaitTermination()
