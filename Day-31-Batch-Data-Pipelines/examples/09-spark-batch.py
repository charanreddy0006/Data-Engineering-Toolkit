from pyspark.sql import SparkSession
from pyspark.sql.functions import sum as _sum

spark = (
    SparkSession.builder
    .appName("daily-service-aggregation")
    .getOrCreate()
)

df = spark.read.parquet("data/service_orders")

daily = (
    df.groupBy("service_date", "dealer_id")
      .agg(_sum("amount").alias("service_revenue"))
)

daily.write.mode("overwrite")     .partitionBy("service_date")     .parquet("output/daily_service_revenue")

spark.stop()
