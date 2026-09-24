from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("vehicle-stream").getOrCreate()

events = (
    spark.readStream
    .format("kafka")
    .option("subscribe", "vehicle.telemetry")
    .load()
)

result = events.selectExpr("CAST(value AS STRING) AS raw_event")

query = (
    result.writeStream
    .format("console")
    .option("checkpointLocation", "/tmp/checkpoints/vehicle")
    .start()
)

query.awaitTermination()
