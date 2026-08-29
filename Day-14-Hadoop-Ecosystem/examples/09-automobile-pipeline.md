# Automobile Hadoop Pipeline

```text
Vehicle Sensors
      |
      v
    Kafka
      |
      v
  Ingestion
      |
      v
     HDFS
      |
 +----+---------+
 |              |
 v              v
Hive        Spark / MapReduce
 |              |
 +------+-------+
        |
        v
 Curated Analytics
        |
        v
     BI / ML
```

Metrics:
- events per vehicle
- average speed
- maximum engine temperature
- average fuel level
- daily telemetry volume
