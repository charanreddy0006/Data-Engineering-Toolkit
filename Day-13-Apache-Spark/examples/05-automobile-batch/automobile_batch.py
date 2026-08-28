from pyspark.sql import SparkSession
from pyspark.sql import functions as F

spark = (
    SparkSession.builder
    .appName("AutomobileBatch")
    .master("local[*]")
    .getOrCreate()
)

service = spark.createDataFrame(
    [
        ("S001", "V001", "Oil Change", 450),
        ("S002", "V001", "Brake Service", 1800),
        ("S003", "V002", "General Service", 1200),
        ("S004", "V003", "AC Service", 2500),
        ("S005", "V002", "Oil Change", 500),
    ],
    ["service_id", "vehicle_id", "service_type", "cost"]
)

summary = (
    service
    .filter(F.col("cost") >= 0)
    .groupBy("vehicle_id")
    .agg(
        F.count("*").alias("service_count"),
        F.sum("cost").alias("total_cost"),
        F.round(F.avg("cost"), 2).alias("average_cost"),
        F.max("cost").alias("maximum_cost")
    )
)

summary.show()
spark.stop()
