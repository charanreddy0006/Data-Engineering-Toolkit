# 15 Jobs Stages and Tasks

## Day 13 — Apache Spark

## 1. Introduction

Apache Spark is an open-source distributed data-processing engine designed
for large-scale analytics. It can process data across many machines and is
used for batch processing, SQL analytics, streaming, machine learning and
graph processing.

The central idea is to divide a large dataset into partitions and execute
work on those partitions in parallel.

```text
                 Spark Application
                        |
                        v
                     Driver
                        |
                        v
                Cluster Manager
                        |
          +-------------+-------------+
          |             |             |
          v             v             v
      Executor      Executor      Executor
          |             |             |
        Tasks         Tasks         Tasks
          |             |             |
     Partitions    Partitions    Partitions
```

## 2. Why Spark Exists

A single computer has limits in CPU, memory, storage and network bandwidth.
When data grows beyond those limits, computation can be distributed across
multiple machines.

```text
Small Dataset
     |
     v
Single Machine
     |
     | growth
     v
Distributed Cluster
     |
     v
Apache Spark
```

Spark reduces the amount of custom distributed-processing code engineers need
to write.

## 3. Architecture

A Spark application normally contains a driver and one or more executors.

```text
Driver
 |
 +-- builds execution plan
 +-- coordinates jobs
 +-- schedules tasks
 |
 +-----------------------------+
 |                             |
 v                             v
Executor 1                  Executor 2
 |                             |
 +-- Task                      +-- Task
 +-- Task                      +-- Task
```

The driver communicates with executors through the cluster environment.

## 4. Execution Model

```text
Application Code
       |
       v
Logical Plan
       |
       v
Optimization
       |
       v
Physical Plan
       |
       v
Jobs
       |
       v
Stages
       |
       v
Tasks
       |
       v
Executors
```

Understanding this model is more important than memorizing individual APIs.

## 5. Spark APIs

Important Spark technologies include:

```text
Spark Core
Spark SQL
DataFrame API
RDD API
Structured Streaming
MLlib
GraphX
PySpark
Scala API
```

Structured applications generally benefit from DataFrames and Spark SQL
because Spark can optimize operations using schema and expression information.

## 6. Practical PySpark Example

```python
from pyspark.sql import SparkSession
from pyspark.sql import functions as F

spark = (
    SparkSession.builder
    .appName("VehicleAnalytics")
    .master("local[*]")
    .getOrCreate()
)

data = [
    ("V001", 72, 91.2),
    ("V002", 81, 94.1),
    ("V001", 68, 90.8),
]

df = spark.createDataFrame(
    data,
    ["vehicle_id", "speed", "engine_temperature"]
)

result = (
    df.groupBy("vehicle_id")
      .agg(
          F.avg("speed").alias("average_speed"),
          F.avg("engine_temperature").alias("average_temperature")
      )
)

result.show()
spark.stop()
```

## 7. RDDs

RDD stands for Resilient Distributed Dataset.

An RDD is an immutable distributed collection.

```python
numbers = spark.sparkContext.parallelize(
    [1, 2, 3, 4, 5]
)

doubled = numbers.map(
    lambda value: value * 2
)

print(doubled.collect())
```

RDDs are important for understanding Spark's original programming model.
For structured data, DataFrames and Spark SQL are commonly preferred.

## 8. Transformations

Transformations create a new dataset from an existing dataset.

Examples:

```python
df.select("vehicle_id")
df.filter(df.speed > 60)
df.withColumn("speed_mps", df.speed / 3.6)
df.drop("unused_column")
```

Transformations are generally evaluated lazily.

## 9. Actions

Actions request a result or output.

Examples:

```python
df.show()
df.count()
df.collect()
df.write.parquet("output/")
```

`collect()` should not be used casually on large datasets because it sends
the resulting data to the driver.

## 10. Lazy Evaluation

Spark normally builds a plan before executing transformations.

```text
Read
 ↓
Filter
 ↓
Select
 ↓
Aggregate
 ↓
Write
```

The actual computation begins when an action requires the result.

This gives Spark opportunities to optimize the execution plan.

## 11. DAG

A DAG is a directed acyclic graph describing dependencies between operations.

```text
Read
 |
 v
Filter
 |
 v
Select
 |
 v
GroupBy
 |
 v
Write
```

Spark uses this dependency information to organize execution into stages.

## 12. Jobs, Stages and Tasks

```text
Application
   |
   +-- Job
       |
       +-- Stage
       |    |
       |    +-- Task
       |    +-- Task
       |
       +-- Stage
            |
            +-- Task
            +-- Task
```

A task normally works on one partition for a stage.

The Spark UI exposes these levels and is an important debugging tool.

## 13. Partitions

A partition is a chunk of distributed data.

```text
Dataset
 |
 +-- Partition 0
 +-- Partition 1
 +-- Partition 2
 +-- Partition 3
```

Partition count influences parallelism and task overhead.

Too few partitions can underuse a cluster. Too many small partitions can create
excessive scheduling overhead.

## 14. Shuffle

A shuffle redistributes data between partitions.

```text
Partition 0 ---Partition 1 ----+----> Network Redistribution
Partition 2 ---/              |
                              v
                       New Partitions
```

Large aggregations, joins and distinct operations can trigger shuffles.

Shuffles can be expensive because they involve network traffic and sometimes
disk I/O.

## 15. DataFrames

DataFrames represent structured distributed data.

```python
df = spark.createDataFrame(
    [
        ("V001", 72),
        ("V002", 81)
    ],
    ["vehicle_id", "speed"]
)

df.show()
df.printSchema()
```

DataFrames provide named columns and allow Spark to optimize many expressions.

## 16. Spark SQL

Spark SQL allows SQL queries against DataFrames and tables.

```python
df.createOrReplaceTempView("vehicles")

result = spark.sql(
    "SELECT vehicle_id, AVG(speed) AS avg_speed "
    "FROM vehicles GROUP BY vehicle_id"
)

result.show()
```

SQL and the DataFrame API can be used together.

## 17. Joins

Joins combine records from related datasets.

```python
result = service.join(
    vehicle,
    service.vehicle_id == vehicle.vehicle_id,
    "inner"
)
```

Join performance depends on dataset size, key distribution, partitioning and
the physical strategy selected by Spark.

## 18. Window Functions

Window functions calculate values across related rows.

```python
from pyspark.sql.window import Window
from pyspark.sql import functions as F

window = (
    Window
    .partitionBy("vehicle_id")
    .orderBy("event_time")
)

result = df.withColumn(
    "previous_speed",
    F.lag("speed").over(window)
)
```

They are useful for time-series analysis, ranking and sequential calculations.

## 19. Parquet

Parquet is a columnar storage format frequently used with Spark.

```python
df.write.mode("overwrite").parquet(
    "data/vehicles"
)

loaded = spark.read.parquet(
    "data/vehicles"
)
```

Columnar storage can reduce I/O when queries need only selected columns.

## 20. Partitioned Storage

```python
(
    df.write
      .mode("overwrite")
      .partitionBy("event_date")
      .parquet("lake/vehicles")
)
```

Possible layout:

```text
lake/vehicles/
├── event_date=2026-08-27/
└── event_date=2026-08-28/
```

Partitioning should be based on actual query patterns and data volume.

## 21. Caching

Caching can improve repeated access to the same dataset.

```python
clean = df.filter(df.speed >= 0)

clean.cache()

clean.count()
clean.groupBy("vehicle_id").count().show()
```

Caching uses cluster memory and should be applied when reuse justifies the
resource cost.

## 22. Broadcast Joins

A small dataset can sometimes be broadcast.

```python
from pyspark.sql.functions import broadcast

result = large_df.join(
    broadcast(small_df),
    "vehicle_id"
)
```

Broadcasting is useful only when the broadcast side is genuinely small enough
for the executor resources.

## 23. Performance Optimization

Start with measurement:

```text
Spark UI
   |
   +-- Job duration
   +-- Stage duration
   +-- Shuffle
   +-- Task distribution
   +-- Input / Output
   +-- Executor memory
   +-- Failed tasks
```

Useful techniques include filtering early, selecting required columns,
avoiding unnecessary shuffles, controlling partition counts, using built-in
functions and managing output file sizes.

## 24. Structured Streaming

Structured Streaming provides streaming computation using structured APIs.

```text
Kafka
 |
 v
Spark Structured Streaming
 |
 v
Validation
 |
 v
Transformation
 |
 v
Aggregation
 |
 v
Data Lake
```

Example:

```python
events = (
    spark.readStream
    .format("rate")
    .option("rowsPerSecond", 10)
    .load()
)
```

## 25. Watermarks

Watermarks help streaming applications manage late-arriving event-time data
and limit state growth.

Conceptually:

```python
events = events.withWatermark(
    "event_time",
    "10 minutes"
)
```

The appropriate value depends on source behavior and business requirements.

## 26. Kafka

Spark can consume Kafka topics through Structured Streaming.

```text
Vehicle Sensors
      |
      v
    Kafka
      |
      v
Spark Streaming
      |
      v
Transform
      |
      v
Data Lake
```

Kafka provides event transport. Spark provides distributed processing.

## 27. Fault Tolerance

Spark can recover many failed computations using lineage and recomputation.

```text
Input
 |
 v
Transform A
 |
 v
Transform B
 |
 X Executor Failure
 |
 v
Recompute Required Partition
```

Streaming applications use checkpoints for recovery of progress and state
where required.

## 28. PySpark

PySpark is the Python API for Apache Spark.

```python
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder
    .appName("ProductionJob")
    .getOrCreate()
)

df = spark.read.parquet("input/")
result = df.filter(df["cost"] > 0)

result.write.mode("overwrite").parquet(
    "output/"
)

spark.stop()
```

PySpark is widely used in data engineering because Python is common across
data platforms and machine-learning workflows.

## 29. MLlib

Spark MLlib provides distributed machine-learning functionality.

A typical pipeline is:

```text
Raw Data
   |
   v
Feature Transformation
   |
   v
Training Dataset
   |
   v
Model Training
   |
   v
Evaluation
   |
   v
Predictions
```

Spark ML pipelines can combine feature transformers and estimators into a
repeatable workflow.

## 30. Monitoring

The Spark UI exposes:

```text
Jobs
Stages
Tasks
Executors
SQL
Storage
Environment
```

When a job is slow, inspect the UI before changing configuration.

Useful metrics include:

- task duration
- input size
- shuffle read
- shuffle write
- executor memory
- failed tasks
- stage duration

## 31. Security

Production Spark systems should consider:

```text
Authentication
Authorization
Encryption
Secret Management
Network Isolation
Storage Permissions
Database Permissions
Audit Logging
```

Credentials should never be hard-coded in source-controlled applications.

## 32. Spark with Airflow

Airflow can schedule and coordinate Spark applications.

```text
Airflow DAG
    |
    v
Submit Spark Job
    |
    v
Spark Cluster
    |
    v
Curated Data
    |
    v
Warehouse / dbt
```

Airflow handles orchestration. Spark performs distributed computation.

## 33. Spark with Data Lakes

```text
Sources
   |
   v
Raw Data Lake
   |
   v
Spark
   |
   v
Curated Data
   |
   v
Analytics
```

Spark is commonly used for large transformations in object-storage-based
data platforms.

## 34. Automobile Industry Example

Connected vehicles can produce:

```json
{
  "vehicle_id": "V001",
  "timestamp": "2026-08-28T10:30:00Z",
  "speed": 72,
  "engine_temperature": 91.2,
  "fuel_level": 61
}
```

Complete architecture:

```text
Vehicles
   |
   v
Kafka
   |
   v
Spark Structured Streaming
   |
   +----> Invalid Events
   |
   v
Raw Data Lake
   |
   v
Spark Batch
   |
   +----> Vehicle Metrics
   +----> Service Analytics
   +----> ML Features
   |
   v
Warehouse
   |
   v
dbt
   |
   v
Power BI / ML
```

Spark performs the distributed processing layer in this architecture.

## 35. Production Architecture

```text
                    Kafka
                      |
                      v
             Spark Streaming
                      |
             +--------+--------+
             |                 |
             v                 v
          Data Lake         Alerts
             |
             v
        Spark Batch
             |
       +-----+------+
       |            |
       v            v
   Analytics      Features
       |
       v
   Warehouse
       |
       v
      dbt
       |
       v
    BI / ML
```

Production requirements include schema management, data quality,
checkpointing, monitoring, security, logging, testing, resource management
and deployment automation.

## 36. Best Practices

1. Prefer DataFrames and Spark SQL for structured workloads.
2. Select only required columns.
3. Filter early where appropriate.
4. Avoid unnecessary shuffles.
5. Use built-in functions before custom UDFs.
6. Cache only reused data.
7. Avoid huge collect operations.
8. Use suitable columnar storage.
9. Control small-file creation.
10. Inspect Spark UI before optimizing.
11. Test with realistic datasets.
12. Parameterize environments.
13. Secure credentials.
14. Monitor streaming checkpoints.
15. Document production jobs.

## 37. Common Mistakes

1. Treating Spark like pandas on a larger machine.
2. Calling collect on massive datasets.
3. Overusing Python UDFs.
4. Ignoring data skew.
5. Caching everything.
6. Creating excessive small files.
7. Using arbitrary partition counts.
8. Ignoring shuffle stages.
9. Hard-coding cluster configuration.
10. Failing to monitor streaming jobs.

## 38. Advantages

- Distributed computation
- Batch processing
- Structured Streaming
- SQL support
- Python and Scala APIs
- Large ecosystem
- Fault-tolerant execution
- Data-lake integration
- Machine-learning support

## 39. Limitations

- Cluster operation adds complexity.
- Small workloads may not benefit from Spark.
- Shuffles can be expensive.
- Poor partitioning can reduce performance.
- Streaming state requires careful design.
- Compute resources can become costly.
- Distributed debugging requires specialized knowledge.

## 40. Comparison

| Technology | Main Strength |
|---|---|
| Apache Spark | General distributed processing |
| Apache Flink | Stateful stream processing |
| Hadoop MapReduce | Distributed batch processing |
| Pandas | Single-machine analytics |
| Kafka | Event streaming |
| Apache Beam | Portable data-processing model |

Spark frequently works with Kafka and Airflow rather than replacing them.

## 41. Interview Questions

### Beginner

1. What is Apache Spark?
2. What is a driver?
3. What is an executor?
4. What is a partition?
5. What is a transformation?
6. What is an action?
7. What is lazy evaluation?
8. What is a DataFrame?

### Intermediate

9. Explain DAG execution.
10. Explain jobs, stages and tasks.
11. What is a shuffle?
12. RDD versus DataFrame?
13. What is a broadcast join?
14. Why is Parquet useful?
15. What is caching?
16. What is Structured Streaming?

### Advanced

17. How would you optimize a slow Spark job?
18. How would you handle data skew?
19. How would you design a streaming pipeline?
20. How do watermarks work?
21. How do checkpoints help recovery?
22. How would you deploy Spark on Kubernetes?
23. How would you design connected-vehicle processing?

## 42. Cheat Sheet

```text
Driver          = Coordinates the application
Executor        = Executes tasks
Partition       = Distributed data unit
Transformation  = Defines a new computation
Action          = Triggers execution
DAG             = Dependency graph
Job             = Execution created by an action
Stage           = Group of tasks
Task            = Work performed for a partition
Shuffle         = Data redistribution
DataFrame       = Structured distributed dataset
Spark SQL       = SQL interface
Checkpoint      = Recovery/progress mechanism
Watermark       = Event-time state boundary
```

## 43. Mini Project

Build automobile service analytics.

Input:

```text
service_id,vehicle_id,service_type,cost
S001,V001,Oil Change,450
S002,V001,Brake Service,1800
S003,V002,General Service,1200
S004,V003,AC Service,2500
S005,V002,Oil Change,500
```

Calculate:

```text
service_count
total_cost
average_cost
maximum_cost
```

PySpark:

```python
result = (
    service
    .filter(F.col("cost") >= 0)
    .groupBy("vehicle_id")
    .agg(
        F.count("*").alias("service_count"),
        F.sum("cost").alias("total_cost"),
        F.avg("cost").alias("average_cost"),
        F.max("cost").alias("maximum_cost")
    )
)
```

Write the result to partitioned Parquet and use it as an analytical dataset.

## 44. End-to-End Project

Build a connected-vehicle platform:

```text
Vehicle Sensors
      |
      v
Kafka
      |
      v
Spark Structured Streaming
      |
      +----> Invalid Data
      |
      v
Data Lake
      |
      v
Spark Batch
      |
      +----> Vehicle Metrics
      +----> Service Metrics
      +----> ML Features
      |
      v
Warehouse
      |
      v
dbt
      |
      v
Power BI / ML
```

Required capabilities:

- telemetry validation
- identifier normalization
- late-data handling
- checkpoints
- partitioned storage
- data-quality checks
- monitoring
- testing
- secure configuration
- scheduled batch processing

## 45. Final Revision Checklist

```text
[ ] Spark Architecture
[ ] Driver and Executors
[ ] Cluster Managers
[ ] RDDs
[ ] Transformations
[ ] Actions
[ ] Lazy Evaluation
[ ] DAG
[ ] Jobs / Stages / Tasks
[ ] Partitions
[ ] DataFrames
[ ] Spark SQL
[ ] Joins
[ ] Window Functions
[ ] Parquet
[ ] Partitioning
[ ] Caching
[ ] Shuffle
[ ] Broadcast Joins
[ ] Performance
[ ] Fault Tolerance
[ ] Structured Streaming
[ ] Watermarks
[ ] Kafka
[ ] Databases
[ ] Data Lakes
[ ] PySpark
[ ] MLlib
[ ] Security
[ ] Monitoring
[ ] Testing
[ ] Airflow
[ ] Docker
[ ] Kubernetes
[ ] Cloud
[ ] Automobile Project
```

## Conclusion

Apache Spark is a distributed processing engine that enables large-scale batch
and streaming computation. The key concepts are partitions, tasks, stages,
jobs, shuffles, executors and driver coordination.

In a modern data platform:

```text
Kafka       -> Event Transport
Spark       -> Distributed Processing
Data Lake   -> Large-Scale Storage
Airflow     -> Orchestration
dbt         -> SQL Transformation
Warehouse   -> Analytics
Power BI    -> Visualization
```

Learning these boundaries helps you design systems where each technology has
a clear responsibility.
