from pyspark.sql import SparkSession

spark = (
    SparkSession.builder
    .appName("SparkBasics")
    .master("local[*]")
    .getOrCreate()
)

numbers = spark.sparkContext.parallelize([1, 2, 3, 4, 5])

doubled = numbers.map(lambda x: x * 2)
even_numbers = doubled.filter(lambda x: x % 2 == 0)

print("Doubled:", doubled.collect())
print("Even:", even_numbers.collect())

spark.stop()
