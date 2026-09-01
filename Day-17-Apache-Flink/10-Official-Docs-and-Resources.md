# Official Documentation and Resources

## Official Flink

https://flink.apache.org/

## Documentation

https://nightlies.apache.org/flink/flink-docs-stable/

## Documentation Sections

Important areas to study:

```text
Concepts
DataStream API
Table API
SQL
State & Fault Tolerance
Connectors
Deployment
Operations
Monitoring
Security
```

## Recommended Learning Order

```text
1. Fundamentals
2. Architecture
3. DataStream API
4. Event Time
5. Watermarks
6. Windows
7. Keyed State
8. Checkpointing
9. Savepoints
10. Kafka Connector
11. Flink SQL
12. CEP
13. Performance
14. Monitoring
15. Kubernetes
16. Production Architecture
```

## Practice Strategy

Start with a bounded local stream:

```text
fromElements()
```

Then move to:

```text
Kafka
 ↓
Flink
 ↓
Windows
 ↓
State
 ↓
Checkpoint
 ↓
Production Sink
```

## Final Goal

You should be able to explain and implement:

```text
Kafka → Flink → State → Window → Alert
```

and then expand it into:

```text
Vehicles
   ↓
Kafka
   ↓
Flink Cluster
   ↓
Real-Time Processing
   ↓
Data Lake
   ↓
Warehouse / BI / ML
```
