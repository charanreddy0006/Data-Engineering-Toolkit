# Day 15 — Apache Kafka

Complete Apache Kafka learning module for the **Data Engineering Toolkit**.

## Structure

```text
Day-15-Apache-Kafka/
├── 01-Introduction/
├── 02-Why-Kafka-Exists/
├── ...
├── 87-Automobile-Industry-Example/
├── 88-Production-Architecture/
├── ...
├── 98-End-to-End-Project/
├── examples/
│   ├── Python producer
│   ├── Python consumer
│   ├── Automobile telemetry producer
│   ├── Kafka CLI commands
│   ├── JSON event
│   ├── Avro schema
│   └── Docker Compose
└── README.md
```

## Learning Flow

```text
Fundamentals
     ↓
Topics → Partitions → Offsets
     ↓
Producers → Consumers → Groups
     ↓
Replication → ISR → KRaft
     ↓
Semantics → Retention → Compaction
     ↓
Connect → Schema Registry → Streams
     ↓
Security → Monitoring → Performance
     ↓
Production Architecture
     ↓
Automobile Event Streaming Project
```

## Automobile Use Case

```text
Vehicle
  ↓
Telemetry Producer
  ↓
Kafka
  ↓
Spark / Flink
  ↓
Data Lake + Real-Time Alerts
  ↓
Warehouse
  ↓
BI / ML
```

## Local Example

Install the Python Kafka client:

```bash
pip install kafka-python
```

Start the provided local Kafka environment:

```bash
cd examples
docker compose up -d
```

Create the telemetry topic using:

```bash
bash 04-topic-commands.sh
```

Run the consumer:

```bash
python 02-python-consumer.py
```

In another terminal run:

```bash
python 01-python-producer.py
```

## Repository Standards

Each topic follows the Data Engineering Toolkit learning approach:

- beginner-friendly fundamentals
- architecture
- practical examples
- production considerations
- automobile industry context
- best practices
- common mistakes
- interview preparation
- revision checklist

## Official Documentation

https://kafka.apache.org/documentation/
