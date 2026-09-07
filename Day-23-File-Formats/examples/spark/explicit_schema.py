from pyspark.sql import SparkSession
from pyspark.sql.types import (
    StructType,
    StructField,
    StringType,
    DoubleType,
)

spark = SparkSession.builder.appName("ExplicitSchema").getOrCreate()

schema = StructType([
    StructField("event_id", StringType(), False),
    StructField("vehicle_id", StringType(), False),
    StructField("speed_kph", DoubleType(), True),
    StructField("battery_soc", DoubleType(), True),
])

df = (
    spark.read
    .schema(schema)
    .json("telemetry.jsonl")
)

df.printSchema()
df.show()

spark.stop()
