# Day 17 — Apache Flink

A complete learning module for Apache Flink in the Data Engineering Toolkit.

## Goal

Learn how Flink processes bounded and unbounded data, manages state, handles
event time, windows, checkpoints, failures, connectors, SQL, Kafka integration,
monitoring, scaling and production workloads.

## Learning Flow

```text
Flink Basics
    ↓
Architecture
    ↓
Streams and APIs
    ↓
Event Time + Watermarks
    ↓
Windows
    ↓
State
    ↓
Checkpoints + Savepoints
    ↓
Fault Tolerance
    ↓
Kafka + Connectors
    ↓
Flink SQL
    ↓
CEP
    ↓
Performance + Monitoring
    ↓
Production Deployment
    ↓
Automobile Real-Time Project
```

## Core Architecture

```text
                         FLINK CLUSTER

                         JobManager
                    /        |        \
                   /         |         \
             Scheduling   Checkpoints   Coordination
                  |
        +---------+----------+
        |                    |
        v                    v
   TaskManager 1       TaskManager 2
   +---------+          +---------+
   | Slot 1  |          | Slot 1  |
   | Slot 2  |          | Slot 2  |
   +---------+          +---------+

Sources → Operators → State/Windows → Sinks
```

## Automobile Use Case

```text
Vehicle Sensors
       ↓
     Kafka
       ↓
     Flink
       ↓
+------+-------+---------+
|              |         |
Speed        Thermal    Fault
Analysis     Analysis   Detection
|              |         |
+--------------+---------+
               ↓
          Real-Time Alerts
               ↓
       Data Lake / Services
               ↓
             BI / ML
```

## Contents

The module contains detailed topic files covering architecture, DataStream,
Table API, SQL, event time, watermarks, windows, state, checkpointing,
fault tolerance, connectors, Kafka, CEP, security, monitoring, performance,
Docker, Kubernetes and production architecture.

## Example Commands

```bash
./bin/start-cluster.sh
./bin/flink list
./bin/flink run target/vehicle-flink-job.jar
./bin/stop-cluster.sh
```

## Official Documentation

- https://flink.apache.org/
- https://nightlies.apache.org/flink/flink-docs-stable/
