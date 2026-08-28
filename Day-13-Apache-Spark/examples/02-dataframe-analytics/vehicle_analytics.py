from pyspark.sql import SparkSession
from pyspark.sql import functions as F

spark = (
    SparkSession.builder
    .appName("VehicleAnalytics")
    .master("local[*]")
    .getOrCreate()
)

data = [
    ("V001", "SUV", 72, 91.2),
    ("V002", "SEDAN", 81, 94.1),
    ("V001", "SUV", 68, 90.8),
    ("V003", "HATCHBACK", 65, 88.5),
]

df = spark.createDataFrame(
    data,
    ["vehicle_id", "vehicle_type", "speed", "engine_temperature"]
)

result = (
    df.filter(F.col("speed") >= 0)
      .groupBy("vehicle_id", "vehicle_type")
      .agg(
          F.count("*").alias("event_count"),
          F.round(F.avg("speed"), 2).alias("average_speed"),
          F.round(
              F.avg("engine_temperature"), 2
          ).alias("average_temperature")
      )
)

result.show(truncate=False)
spark.stop()
