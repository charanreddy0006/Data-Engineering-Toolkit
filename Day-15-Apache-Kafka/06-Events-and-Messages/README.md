# 06 Events and Messages

> **Day 15 — Apache Kafka | Data Engineering Toolkit**

## 1. Introduction

Apache Kafka is a distributed event-streaming platform used to publish,
store, process, and consume streams of records. Kafka is designed for
high-throughput, scalable, fault-tolerant data pipelines.

A useful mental model is to think of Kafka as a durable event backbone:

```text
Applications / Vehicles / Databases
                |
                v
            Producers
                |
                v
        +----------------+
        |  Kafka Cluster |
        +----------------+
                |
       +--------+--------+
       |        |        |
       v        v        v
    Topics   Topics   Topics
       |
       v
   Consumers
       |
 +-----+------+--------+
 |            |        |
 v            v        v
Spark        Flink    Services
```

Kafka is not simply a queue. Records are written to partitioned logs and can
remain available according to configured retention policies. Multiple
independent consumer groups can read the same topic.

## 2. Why Kafka Exists

Traditional point-to-point integrations create tight coupling:

```text
Service A ---> Service B
Service A ---> Service C
Service A ---> Database
Service A ---> Analytics
Service B ---> Service C
```

As systems increase, every new integration adds operational complexity.

Kafka changes the architecture:

```text
Producer A ----Producer B -----+----> Kafka ----> Consumer A
Producer C ----/              +----> Consumer B
                              +----> Consumer C
                              +----> Analytics
```

The producer publishes an event once, while many independent consumers can
use that event for different purposes.

## 3. Core Concepts

The most important Kafka concepts are:

| Concept | Meaning |
|---|---|
| Broker | Kafka server |
| Cluster | Group of Kafka brokers |
| Topic | Logical event stream |
| Partition | Ordered, scalable log inside a topic |
| Offset | Position of a record in a partition |
| Producer | Publishes records |
| Consumer | Reads records |
| Consumer Group | Consumers sharing partition work |
| Replica | Copy of a partition |
| Leader | Active replica for a partition |
| ISR | In-sync replicas |

## 4. Event and Message

An event describes something that happened.

Automobile telemetry example:

```json
{
  "vehicle_id": "V001",
  "event_type": "telemetry",
  "timestamp": "2026-08-30T10:30:00Z",
  "speed": 72,
  "engine_temperature": 91.2,
  "fuel_level": 61
}
```

Kafka records can contain a key, value, timestamp, headers, and metadata.
Kafka itself stores bytes; the application decides how structured objects are
serialized.

## 5. Topics

A topic is a named stream of records.

Examples:

```text
vehicle.telemetry
vehicle.location
vehicle.alerts
vehicle.faults
vehicle.service
```

A topic should represent a clear business event stream or data contract.

```text
vehicle.telemetry
        |
 +------+------+------+
 |             |      |
 P0            P1     P2
```

Topics should be named consistently and documented with ownership, schema,
retention, partitioning and expected consumers.

## 6. Partitions

Partitions are central to Kafka scalability.

```text
Topic: vehicle.telemetry

Partition 0: E0 -> E3 -> E6 -> E9
Partition 1: E1 -> E4 -> E7 -> E10
Partition 2: E2 -> E5 -> E8 -> E11
```

Each partition is an ordered log. Kafka guarantees ordering within a
partition, not automatically across all partitions of a topic.

More partitions can increase consumer parallelism, but partitions also add
metadata, file, network and operational overhead.

## 7. Offsets

Every record in a partition receives an offset.

```text
Offset:  0    1    2    3    4
Record: E0   E1   E2   E3   E4
```

An offset is meaningful within its partition.

Consumers use offsets to determine where processing should resume.

A simplified flow is:

```text
Read record
    |
    v
Process record
    |
    v
Commit offset
```

Offset management must be designed together with failure handling.

## 8. Brokers

A broker is a Kafka server responsible for storing partitions and serving
client requests.

```text
Kafka Cluster
+-----------+-----------+-----------+
| Broker 1  | Broker 2  | Broker 3  |
+-----------+-----------+-----------+
```

A production cluster normally uses multiple brokers to distribute data and
workload.

## 9. Producers

A producer publishes records to Kafka.

The producer chooses a topic and partition. A record key can influence
partition selection.

```text
Application
    |
    v
Producer
    |
    +--> Key / Partitioner
    |
    v
Partition Leader
```

Python example:

```python
from kafka import KafkaProducer
import json

producer = KafkaProducer(
    bootstrap_servers=["localhost:9092"],
    key_serializer=lambda key: key.encode("utf-8"),
    value_serializer=lambda value:
        json.dumps(value).encode("utf-8")
)

event = {
    "vehicle_id": "V001",
    "speed": 72
}

producer.send(
    "vehicle.telemetry",
    key="V001",
    value=event
)

producer.flush()
producer.close()
```

## 10. Consumers

A consumer reads records from Kafka.

```python
from kafka import KafkaConsumer
import json

consumer = KafkaConsumer(
    "vehicle.telemetry",
    bootstrap_servers=["localhost:9092"],
    group_id="vehicle-analytics",
    auto_offset_reset="earliest",
    value_deserializer=lambda value:
        json.loads(value.decode("utf-8"))
)

for message in consumer:
    print(message.value)
```

A consumer can process records, write results to another system, and commit
offsets according to its delivery strategy.

## 11. Consumer Groups

A consumer group allows multiple consumers to divide partition work.

```text
Topic
+------+------ +------+
| P0   | P1   | P2   |
+------+------ +------+
   |      |      |
   v      v      v
  C1     C2     C3
```

If there are more consumers than partitions, some consumers may remain idle.

Consumer groups allow multiple applications to independently consume the
same topic:

```text
                 Kafka Topic
                /     |                    /      |              Analytics   Alerts   Archive
          Group      Group     Group
```

## 12. Replication

Kafka replicates partitions across brokers.

```text
Partition 0
     |
     +--> Broker 1 : Leader
     +--> Broker 2 : Follower
     +--> Broker 3 : Follower
```

Replication provides fault tolerance.

A replication factor of three means that Kafka maintains three replicas of a
partition, subject to the topic and cluster configuration.

## 13. Leaders and Followers

Each partition has one leader and zero or more followers.

The leader handles normal client operations for that partition. Followers
replicate the leader's log.

```text
Producer
   |
   v
Leader
 /    v      v
F1     F2
```

When a leader fails, Kafka can elect an eligible replica.

## 14. ISR

ISR means **In-Sync Replicas**.

These replicas are sufficiently caught up with the leader according to
Kafka's replication rules.

```text
Partition 0
 |
 +-- Leader
 +-- ISR Follower
 +-- ISR Follower
 +-- Out-of-sync replica
```

Healthy ISR membership is important for availability and durability.

## 15. KRaft

Modern Kafka uses KRaft for metadata management.

```text
                 Kafka Cluster
                       |
          +------------+------------+
          |                         |
          v                         v
   KRaft Controllers             Brokers
                                  |
                        +---------+---------+
                        |         |         |
                       P0        P1        P2
```

KRaft removes the historical requirement for ZooKeeper in modern Kafka
architectures.

## 16. Producer Flow

A simplified producer flow is:

```text
Application
    |
    v
Kafka Producer
    |
    v
Serialize Record
    |
    v
Select Partition
    |
    v
Partition Leader
    |
    v
Replicate
    |
    v
Acknowledgement
```

Producer configuration determines durability, retry behavior, batching,
compression, and delivery guarantees.

## 17. Consumer Flow

A simplified consumer flow:

```text
Kafka Partition
      |
      v
Fetch Records
      |
      v
Application Processing
      |
      v
Commit Offset
```

The consumer should be designed so that a crash does not corrupt business
state.

## 18. Partitioning and Keys

Keys are useful when related events should be routed consistently.

For automobile telemetry:

```text
vehicle_id = V001
      |
      v
Partitioner
      |
      v
Partition 2
```

This can preserve ordering for events for a vehicle as long as the same key
continues to map to the same partition under the active partitioning
strategy.

Poor key selection can create hot partitions.

## 19. Serialization

Kafka records are bytes. Serialization converts application objects into
bytes.

Common formats:

```text
JSON
Avro
Protobuf
JSON Schema
```

JSON is easy to understand, while schema-based formats provide stronger
contracts and often better storage/network characteristics.

## 20. Rebalancing

A consumer-group rebalance occurs when partition ownership changes.

Possible causes:

- consumer starts
- consumer stops
- consumer crashes
- consumer misses group heartbeats
- topic partition count changes
- subscription changes

```text
Before:
P0 -> C1
P1 -> C2
P2 -> C3

After:
P0 -> C1
P1 -> C1
P2 -> C2
```

Long processing operations should be designed carefully so consumers do not
leave the group unexpectedly.

## 21. Delivery Semantics

Kafka applications commonly discuss:

```text
At-most-once
At-least-once
Exactly-once
```

These describe how processing behaves around failures and retries.

The correct choice depends on business requirements.

## 22. At-Most-Once

A simplified pattern is:

```text
Read
 |
 v
Commit Offset
 |
 v
Process
```

If the application crashes after committing but before processing, the event
may not be processed.

This minimizes duplicate processing at the cost of possible loss.

## 23. At-Least-Once

A simplified pattern:

```text
Read
 |
 v
Process
 |
 v
Commit Offset
```

If the application crashes after processing but before committing, the same
record can be processed again.

Therefore downstream processing should often be idempotent.

## 24. Exactly-Once

Exactly-once requires coordinated processing and correct configuration.

Kafka transactions can support read-process-write patterns within Kafka.

```text
Input Topic
     |
     v
Process
  /      v       v
Topic A Topic B
  \     /
   v   v
Commit Transaction
```

Do not assume exactly-once Kafka behavior automatically makes every external
database or API operation exactly once.

## 25. Idempotent Producers

Idempotent producers help prevent duplicate writes caused by certain producer
retries.

The producer assigns sequencing information so Kafka can identify duplicate
retry attempts under supported conditions.

```text
Producer
   |
   +---- Send
   |
   +---- Retry
          |
          v
       Kafka
          |
          v
   One logical record
```

## 26. Transactions

Kafka transactions allow a producer to group multiple writes into an
atomic transaction.

Typical use case:

```text
Consume Input
      |
      v
Process
      |
      +----> Output Topic A
      |
      +----> Output Topic B
      |
      v
Commit Transaction
```

Transactions are particularly useful for Kafka-to-Kafka processing.

## 27. Retention

Kafka retention determines how long records remain available.

Policies can be based on time and/or storage size.

```text
New Event
   |
   v
Partition Log
   |
   v
Retention Policy
   |
   +--> Keep
   |
   +--> Remove old data
```

Retention should be chosen based on replay requirements, storage capacity,
compliance and business value.

## 28. Log Segments

Each partition log is divided into segment files.

```text
Partition
 |
 +-- Segment 000000
 +-- Segment 000001
 +-- Segment 000002
```

Segments allow Kafka to efficiently perform retention and log management.

## 29. Compaction

Log compaction is useful when the latest value for each key is important.

Example:

```text
V001 -> speed 60
V001 -> speed 70
V001 -> speed 72
```

A compacted topic can eventually retain the latest record for `V001`,
subject to Kafka's compaction behavior.

Compaction is useful for state-like topics and changelog patterns.

## 30. Consumer Lag

Consumer lag indicates how much data a consumer group has not yet processed.

```text
Available records: 100000
Processed records:  95000
Approximate lag:     5000
```

Lag can increase because of:

- slow consumers
- insufficient consumers
- expensive processing
- downstream bottlenecks
- broker/network limitations

Lag should be monitored continuously for important pipelines.

## 31. Producer Acknowledgements

Common producer acknowledgement settings:

```text
acks=0
acks=1
acks=all
```

Conceptually:

- `0`: producer does not wait for broker acknowledgement.
- `1`: leader acknowledgement is required.
- `all`: acknowledgement requires the configured replication condition.

The actual durability depends on the complete replication and broker
configuration.

## 32. Producer Retries

Transient errors can trigger retries.

```text
Producer
   |
   v
Request
   |
  Error
   |
   v
Retry
   |
   v
Kafka
```

Retries should be combined with suitable timeouts and idempotence.

## 33. Batching

Kafka producers can group records into batches.

```text
Event 1 Event 2  Event 3   +--> Producer Batch --> Broker
Event 4  /
```

Batching reduces request overhead and can improve throughput.

Increasing batching can increase latency, so production values should be
based on measurements.

## 34. Compression

Compression reduces data transferred and stored.

Common codecs:

```text
gzip
snappy
lz4
zstd
```

The best option depends on CPU capacity, compression ratio and latency.

## 35. Producer Configuration

Important settings include:

```text
bootstrap.servers
acks
enable.idempotence
retries
compression.type
batch.size
linger.ms
delivery.timeout.ms
max.in.flight.requests.per.connection
```

Defaults vary by Kafka client version. Always verify settings for the
deployed client version.

## 36. Consumer Configuration

Important settings include:

```text
bootstrap.servers
group.id
auto.offset.reset
enable.auto.commit
max.poll.records
max.poll.interval.ms
session.timeout.ms
```

Processing time must be compatible with consumer group timing.

## 37. Broker Configuration

Important operational settings include:

```text
listeners
advertised.listeners
log.dirs
num.partitions
default.replication.factor
log.retention
message size limits
network threads
I/O threads
```

Configuration should be managed as code where practical.

## 38. Kafka CLI

List topics:

```bash
kafka-topics.sh   --bootstrap-server localhost:9092   --list
```

Create topic:

```bash
kafka-topics.sh   --bootstrap-server localhost:9092   --create   --topic vehicle.telemetry   --partitions 3   --replication-factor 1
```

Describe:

```bash
kafka-topics.sh   --bootstrap-server localhost:9092   --describe   --topic vehicle.telemetry
```

## 39. Producer and Consumer CLI

Producer:

```bash
kafka-console-producer.sh   --bootstrap-server localhost:9092   --topic vehicle.telemetry
```

Consumer:

```bash
kafka-console-consumer.sh   --bootstrap-server localhost:9092   --topic vehicle.telemetry   --from-beginning   --group vehicle-analytics
```

Consumer groups can also be inspected using the Kafka consumer-groups CLI.

## 40. Kafka Connect

Kafka Connect is a framework for integrating Kafka with external systems.

```text
Database
   |
   v
Source Connector
   |
   v
Kafka
   |
   v
Sink Connector
   |
   v
Warehouse / Data Lake
```

Connect supports reusable connector-based integrations and distributed
operation.

## 41. Source Connectors

Source connectors import data into Kafka.

Example:

```text
PostgreSQL
     |
     v
CDC / Source Connector
     |
     v
Kafka Topic
```

A source connector can capture database changes and publish them as events.

## 42. Sink Connectors

Sink connectors export Kafka records.

```text
Kafka
  |
  v
Sink Connector
  |
  +--> S3 / Object Storage
  +--> Database
  +--> Search Platform
  +--> Warehouse
```

Connector configuration should include error handling, transforms,
authentication, batching and monitoring.

## 43. Schema Registry

Schema Registry stores and manages schemas for serialized Kafka data.

```text
Producer
   |
   v
Schema Registry
   |
   v
Kafka
   |
   v
Consumer
```

Schema compatibility rules help teams evolve event contracts safely.

## 44. Avro

Avro is a schema-based serialization format frequently used with Kafka.

Example schema:

```json
{
  "type": "record",
  "name": "VehicleTelemetry",
  "fields": [
    {"name": "vehicle_id", "type": "string"},
    {"name": "speed", "type": "double"},
    {"name": "engine_temperature", "type": "double"}
  ]
}
```

Avro separates the schema from the encoded payload and supports schema
evolution patterns.

## 45. JSON Schema and Protobuf

JSON Schema can formalize JSON event structures.

Protobuf uses strongly defined message schemas and compact binary encoding.

Both can be useful when many teams need a stable event contract.

```text
Producer
   |
   v
Schema Contract
   |
   v
Kafka
   |
   v
Consumer
```

## 46. Kafka Streams

Kafka Streams is a Java/Scala client library for building applications that
process Kafka data.

```text
Input Topic
    |
    v
Kafka Streams
    |
 +--+----------+
 |             |
Filter       Aggregate
 |             |
 +------+------+
        |
        v
Output Topic
```

It supports stateless and stateful stream-processing operations.

## 47. Stateful Processing

Stateful applications maintain information across events.

Example:

```text
Vehicle Events
      |
      v
Group by vehicle_id
      |
      v
State Store
      |
      v
Average Speed
```

State stores must be considered when designing recovery, scaling and
repartitioning.

## 48. Joins

Streams can combine related event streams.

```text
Telemetry Stream ----+
                     |
                     +---- Join ----> Enriched Event
                     |
Vehicle Metadata ----+
```

Joins require compatible keys and careful attention to event-time behavior.

## 49. Windows

Windows allow calculations over a period of time.

```text
10:00 -------- 10:05 -------- 10:10
       Window 1       Window 2
```

Common concepts include tumbling, hopping and session windows.

Automobile example:

```text
Average speed per vehicle
over each 5-minute window
```

## 50. ksqlDB

ksqlDB provides SQL-style stream processing for Kafka.

Example:

```sql
SELECT vehicle_id,
       AVG(speed) AS average_speed
FROM vehicle_telemetry
GROUP BY vehicle_id;
```

It is useful when teams want stream processing using SQL rather than
application code.

## 51. Kafka with Spark

Spark Structured Streaming can consume Kafka topics.

```text
Kafka
  |
  v
Spark Structured Streaming
  |
  v
Transform
  |
  v
Data Lake / Warehouse
```

Kafka provides event transport and Spark performs distributed processing.

## 52. Kafka with Flink

Flink is designed for stateful stream processing.

```text
Kafka
  |
  v
Flink
  |
  +--> Real-Time Analytics
  +--> Alerts
  +--> Data Lake
```

Flink is useful for event-time processing, stateful computation and complex
streaming pipelines.

## 53. Kafka with Airflow

Airflow is primarily a workflow orchestration system.

```text
Airflow
   |
   v
Schedule / Trigger
   |
   v
Kafka-related Job
```

Airflow should not replace Kafka as a continuous event-streaming platform.

## 54. Kafka with Databases

Kafka can connect databases to event-driven architectures.

```text
Database
   |
   v
CDC
   |
   v
Kafka
   |
   +--> Services
   +--> Analytics
   +--> Data Lake
```

This reduces direct coupling between producers and downstream systems.

## 55. Kafka with Data Lakes

Kafka can feed analytical storage.

```text
Applications
     |
     v
Kafka
     |
     v
Streaming Processor / Sink
     |
     v
Object Storage / Data Lake
```

Events can be transformed into partitioned analytical datasets.

## 56. Security

Production Kafka security should address:

```text
Authentication
Authorization
TLS
Encryption
ACLs
Secret Management
Audit Logging
```

Security must cover clients, brokers and administrative access.

## 57. Authentication

Authentication establishes client identity.

Kafka environments commonly use SASL mechanisms and/or TLS-based
authentication depending on deployment requirements.

```text
Client
  |
  v
Authentication
  |
  v
Kafka
```

## 58. Authorization

Authorization controls what an authenticated principal can access.

```text
service-a
   |
   +-- WRITE -> vehicle.telemetry

service-b
   |
   +-- READ -> vehicle.telemetry
```

Least privilege should be the default.

## 59. TLS and Encryption

TLS can protect network traffic.

```text
Producer ===== TLS =====> Broker
Consumer ===== TLS =====> Broker
Broker   ===== TLS =====> Broker
```

Certificates, trust stores and key stores require operational management.

## 60. ACLs

Kafka ACLs can restrict operations on topics, consumer groups and other
resources.

Example:

```text
analytics-service
       |
       +-- READ -> vehicle.telemetry

telemetry-service
       |
       +-- WRITE -> vehicle.telemetry
```

Avoid granting broad administrative permissions to application identities.

## 61. Monitoring

Important Kafka metrics include:

```text
Consumer Lag
Bytes In
Bytes Out
Request Latency
Under-Replicated Partitions
Offline Partitions
ISR Changes
Disk Usage
CPU
Network
Controller Health
```

Monitor infrastructure and business-level latency.

## 62. Logging and Debugging

A practical troubleshooting sequence:

```text
Symptom
  |
  v
Check application logs
  |
  v
Check consumer group state
  |
  v
Check topic metadata
  |
  v
Check broker health
  |
  v
Check partitions / ISR
  |
  v
Check network / authentication
```

Avoid changing many configurations simultaneously.

## 63. Performance

Kafka performance is influenced by:

- partition count
- producer batching
- compression
- message size
- replication
- disk throughput
- network bandwidth
- consumer processing speed
- broker CPU and memory

Performance engineering should use measurable throughput and latency targets.

## 64. Scalability

Kafka scales by distributing partitions across brokers.

```text
Topic
 |
 +-- P0 --> Consumer A
 +-- P1 --> Consumer B
 +-- P2 --> Consumer C
 +-- P3 --> Consumer D
```

Partition count determines the maximum parallelism available to a consumer
group.

## 65. High Availability

High availability requires:

- multiple brokers
- suitable replication factors
- healthy ISR
- resilient clients
- adequate capacity
- sensible failure-domain placement

```text
             Kafka Cluster
          /       |              Broker1  Broker2  Broker3
          \       |       /
           Replicated Data
```

## 66. Disaster Recovery

Disaster recovery can use replication or mirroring between environments.

```text
Primary Kafka
      |
      v
Replication / Mirroring
      |
      v
Secondary Kafka
```

Define:

```text
RPO = acceptable data loss window
RTO = acceptable recovery time
```

Test restoration and failover procedures regularly.

## 67. Data Quality

Kafka transports records but does not automatically make them correct.

Validate:

```text
Required fields
Data types
Ranges
Identifiers
Timestamps
Schema compatibility
Duplicate behavior
```

Invalid records can be routed to a DLQ.

## 68. Dead-Letter Topics

A dead-letter topic contains records that could not be processed normally.

```text
Input Topic
     |
     v
Consumer
   /     /     Success Failure
  |       |
  v       v
Output    DLQ
```

DLQ messages should include useful context such as error reason, source
topic, partition and offset where appropriate.

## 69. Error Handling

Distinguish:

```text
Transient Error
Permanent Data Error
Schema Error
Authentication Error
Infrastructure Error
```

Transient errors may be retried. Permanent errors should usually be routed
for investigation instead of blocking the pipeline indefinitely.

## 70. Testing

Kafka systems should test:

- serialization
- partitioning
- producer retries
- consumer processing
- offset commits
- duplicate behavior
- schema evolution
- rebalancing
- failure recovery
- throughput
- latency

Use isolated topics and test environments.

## 71. Docker

Docker is useful for local Kafka development.

```text
Docker
 |
 +-- Kafka Broker
 +-- KRaft Controller
 +-- Application
```

Local settings should not automatically become production settings.

## 72. Kubernetes

Kafka can run on Kubernetes, but production deployment requires careful
planning for:

- persistent storage
- networking
- broker identity
- availability
- rolling changes
- resource limits
- disruption handling
- monitoring

Kafka operators can automate parts of lifecycle management.

## 73. Cloud Kafka

Managed Kafka services reduce infrastructure administration.

```text
Applications
     |
     v
Managed Kafka
     |
 +---+----------+
 |              |
 v              v
Stream        Data Lake
Processing
```

Cloud designs must consider IAM, networking, cost, availability and data
residency.

## 74. Automobile Industry Example

Connected vehicles produce large volumes of telemetry.

```text
Vehicle Sensors
      |
      v
Kafka Producer
      |
      v
Kafka Cluster
      |
 +----+---------+---------+
 |              |         |
 v              v         v
Telemetry      Alerts    Faults
Topic          Topic     Topic
 |
 v
Spark / Flink
 |
 +---------+---------+
 |                   |
 v                   v
Data Lake        Real-Time Alerts
 |
 v
Warehouse
 |
 v
BI / ML
```

Example event:

```json
{
  "vehicle_id": "V001",
  "timestamp": "2026-08-30T10:30:00Z",
  "speed": 72,
  "engine_temperature": 91.2,
  "fuel_level": 61
}
```

Possible analytics:

```text
Average speed by vehicle
Maximum engine temperature
Fuel consumption trends
Harsh driving events
Fault frequency
Vehicle utilization
Maintenance indicators
```

## 75. Production Architecture

```text
                         Data Sources
                              |
                +-------------+-------------+
                |                           |
                v                           v
         Kafka Producers                 CDC Sources
                |                           |
                +-------------+-------------+
                              |
                              v
                       Kafka Cluster
                              |
       +----------------------+----------------------+
       |                      |                      |
       v                      v                      v
  Spark / Flink          Kafka Connect          Services
       |                      |                      |
       v                      v                      v
 Analytics              Data Lake / DW        Applications
       |                      |
       +-----------+----------+
                   |
                   v
                BI / ML
```

Cross-cutting services:

```text
Security
Schema Governance
Monitoring
Alerting
Logging
Backup / DR
CI/CD
```

## 76. Best Practices

1. Define clear event contracts.
2. Choose partition keys based on access and ordering requirements.
3. Plan partitions for expected scale.
4. Use replication for important topics.
5. Monitor consumer lag.
6. Use idempotent producers where appropriate.
7. Select delivery semantics intentionally.
8. Manage schemas centrally.
9. Use DLQs for poison messages.
10. Secure all clients and brokers.
11. Define retention deliberately.
12. Test broker and consumer failures.
13. Monitor disk and network capacity.
14. Make downstream processing idempotent where possible.
15. Document ownership and operational responsibilities.

## 77. Common Mistakes

- Treating Kafka as a traditional relational database.
- Assuming ordering across all partitions.
- Choosing a poor partition key.
- Ignoring consumer lag.
- Creating too many or too few partitions without measurement.
- Retaining unlimited data without storage planning.
- Hard-coding credentials.
- Retrying permanently invalid messages forever.
- Changing schemas without compatibility checks.
- Treating Airflow as a streaming engine.
- Assuming replication alone is disaster recovery.

## 78. Advantages and Limitations

### Advantages

- High throughput
- Horizontal scalability
- Durable event logs
- Partition-based parallelism
- Consumer groups
- Replication
- Strong ecosystem
- Stream-processing integration
- Decoupled architecture

### Limitations

- Operational complexity
- Partition planning is important
- Ordering is partition-scoped
- Storage can grow rapidly
- Schema governance is necessary
- Exactly-once requires careful end-to-end design
- Monitoring and capacity planning are essential

## 79. Comparison

| Technology | Main Strength |
|---|---|
| Apache Kafka | Distributed event streaming |
| RabbitMQ | Messaging and routing |
| Apache Pulsar | Distributed messaging/streaming |
| Amazon Kinesis | Managed cloud streaming |
| Spark | Distributed data processing |
| Flink | Stateful stream processing |

Kafka is primarily an event backbone. Spark and Flink are primarily
processing engines.

## 80. Interview Questions

### Beginner

1. What is Apache Kafka?
2. What is a topic?
3. What is a partition?
4. What is an offset?
5. What is a broker?
6. What is a producer?
7. What is a consumer?
8. What is a consumer group?

### Intermediate

9. Explain Kafka replication.
10. What is ISR?
11. Explain partitioning.
12. What is consumer lag?
13. Explain `acks`.
14. What is Kafka Connect?
15. What is Schema Registry?
16. Explain at-least-once processing.
17. What is log compaction?
18. What is KRaft?

### Advanced

19. How would you design Kafka for millions of vehicle events per second?
20. How would you choose a partition key?
21. How would you handle consumer lag?
22. How would you design disaster recovery?
23. How would you handle poison messages?
24. How would you evolve schemas safely?
25. Kafka versus RabbitMQ?
26. Kafka versus Flink?
27. How would you design an exactly-once Kafka pipeline?

## 81. Cheat Sheet

```text
Kafka       = Event-streaming platform
Broker      = Kafka server
Cluster     = Group of brokers
Topic       = Logical event stream
Partition   = Ordering + parallelism unit
Offset      = Record position
Producer    = Publishes events
Consumer    = Reads events
Group       = Consumers sharing partitions
Replica     = Partition copy
Leader      = Active partition replica
ISR         = In-sync replicas
KRaft       = Modern Kafka metadata architecture
Lag         = Consumer processing delay
Connect     = External-system integration
Streams     = Kafka stream-processing library
DLQ         = Failed-event destination
```

## 82. Official Documentation

Primary documentation:

```text
https://kafka.apache.org/documentation/
https://kafka.apache.org/quickstart
https://kafka.apache.org/documentation/#producerconfigs
https://kafka.apache.org/documentation/#consumerconfigs
https://kafka.apache.org/documentation/#connect
https://kafka.apache.org/documentation/streams/
```

Always use documentation matching the Kafka and client versions being used.

## 83. Additional Learning Resources

Study in this order:

```text
Kafka Fundamentals
        ↓
Topics / Partitions / Offsets
        ↓
Producer / Consumer
        ↓
Consumer Groups
        ↓
Replication / ISR
        ↓
KRaft
        ↓
Delivery Semantics
        ↓
Connect / Schema Registry
        ↓
Kafka Streams
        ↓
Security / Monitoring
        ↓
Production Design
```

Build small applications rather than only reading theory.

## 84. Mini Project

### Vehicle Telemetry Event Platform

Create:

```text
vehicle.telemetry
vehicle.location
vehicle.alerts
vehicle.faults
vehicle.telemetry.dlq
```

Produce events using:

```json
{
  "vehicle_id": "V001",
  "timestamp": "2026-08-30T10:30:00Z",
  "speed": 72,
  "engine_temperature": 91.2,
  "fuel_level": 61
}
```

Use `vehicle_id` as the key.

Build a consumer group that calculates:

```text
Events per vehicle
Average speed
Maximum engine temperature
High-temperature alerts
Consumer lag
```

Send invalid events to the DLQ.

## 85. End-to-End Project

Build a connected-vehicle event platform:

```text
Vehicles
   |
   v
Telemetry Producers
   |
   v
Kafka Cluster
   |
 +----------------+----------------+
 |                |                |
 v                v                v
Telemetry       Alerts           Faults
Topic           Topic            Topic
 |
 v
Spark / Flink
 |
 +-------------------+
 |                   |
 v                   v
Data Lake          Alerts
 |
 v
Warehouse
 |
 v
BI / ML
```

Project requirements:

- define schemas
- choose partition keys
- configure replication
- create consumer groups
- monitor lag
- handle retries
- implement DLQ
- manage schema evolution
- secure clients
- monitor brokers
- test failures
- document topic ownership
- define retention

## 86. Final Revision Checklist

```text
[ ] Kafka fundamentals
[ ] Architecture
[ ] Events
[ ] Topics
[ ] Partitions
[ ] Offsets
[ ] Brokers
[ ] Producers
[ ] Consumers
[ ] Consumer groups
[ ] Replication
[ ] Leaders
[ ] ISR
[ ] KRaft
[ ] Producer flow
[ ] Consumer flow
[ ] Partition keys
[ ] Serialization
[ ] Rebalancing
[ ] Delivery semantics
[ ] Idempotence
[ ] Transactions
[ ] Retention
[ ] Compaction
[ ] Consumer lag
[ ] Acknowledgements
[ ] Retries
[ ] Batching
[ ] Compression
[ ] CLI
[ ] Kafka Connect
[ ] Schema Registry
[ ] Avro
[ ] Protobuf
[ ] Kafka Streams
[ ] Windows
[ ] Spark integration
[ ] Flink integration
[ ] Database integration
[ ] Data lakes
[ ] Security
[ ] Monitoring
[ ] Performance
[ ] High availability
[ ] Disaster recovery
[ ] Data quality
[ ] DLQ
[ ] Testing
[ ] Docker
[ ] Kubernetes
[ ] Cloud
[ ] Automobile project
[ ] Production architecture
```

## 87. Git Commit

```bash
git add .
git commit -m "Add Day 15 Apache Kafka complete learning module"
git push
```

## 88. Conclusion

Kafka provides a scalable event backbone for modern data-engineering
architectures.

```text
Producers
    ↓
Kafka Topics
    ↓
Partitions
    ↓
Consumer Groups
    ↓
Stream / Batch Processing
    ↓
Data Lake / Warehouse / Applications
```

For automobile data engineering, Kafka can connect vehicle telemetry,
real-time alerts, databases, stream processors, data lakes, BI systems and
machine-learning workflows.
