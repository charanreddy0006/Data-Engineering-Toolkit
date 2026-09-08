from pyspark.sql import SparkSession, functions as F

spark = SparkSession.builder.appName("day24-data-quality").getOrCreate()

df = (
    spark.read
    .option("header", True)
    .option("inferSchema", True)
    .csv("../data/telemetry.csv")
)

metrics = df.agg(
    F.count("*").alias("total_rows"),
    F.sum(F.col("vehicle_id").isNull().cast("int")).alias("missing_vehicle_id"),
    F.sum((~F.col("speed_kmh").between(0, 350)).cast("int")).alias("invalid_speed"),
    F.sum((~F.col("battery_soc").between(0, 100)).cast("int")).alias("invalid_soc"),
).first()

print(metrics.asDict())
spark.stop()
