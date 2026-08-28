from pyspark.sql import SparkSession

spark = (
    SparkSession.builder
    .appName("VehicleSQL")
    .master("local[*]")
    .getOrCreate()
)

df = spark.createDataFrame(
    [
        ("V001", 72, 450),
        ("V001", 81, 1200),
        ("V002", 65, 700),
        ("V002", 78, 1500),
    ],
    ["vehicle_id", "speed", "service_cost"]
)

df.createOrReplaceTempView("vehicle_events")

query = (
    "SELECT vehicle_id, COUNT(*) AS events, "
    "ROUND(AVG(speed), 2) AS average_speed, "
    "SUM(service_cost) AS total_service_cost "
    "FROM vehicle_events GROUP BY vehicle_id "
    "ORDER BY vehicle_id"
)

result = spark.sql(query)
result.show()

spark.stop()
