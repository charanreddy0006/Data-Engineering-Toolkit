# 29 Avro and Schema

## Day 12 — Apache NiFi

## Introduction

Apache NiFi is an open-source data integration and data-flow automation
platform. It is used to move, route, transform, enrich, validate and deliver
data between different systems.

The basic idea is:

```text
SOURCE
  |
  v
RECEIVE
  |
  v
VALIDATE
  |
  v
TRANSFORM
  |
  v
ROUTE
  |
  v
DESTINATION
```

NiFi is especially useful when an organization has many databases, APIs,
files, message brokers, cloud services and applications that must exchange
data reliably.

## Why It Is Useful

Without a common integration platform, organizations often create separate
scripts for every connection:

```text
Database -> Python Script -> API
CSV      -> Shell Script   -> Database
Kafka    -> Java Service   -> Data Lake
API      -> Custom App     -> Warehouse
```

NiFi provides a common visual flow layer:

```text
Database --------+
API -------------+
Files -----------+----> Apache NiFi ----> Data Lake
Kafka -----------+                    +-> Database
Applications ----+                    +-> Kafka
                                      +-> APIs
```

## Core Architecture

```text
                    NiFi UI
                       |
                       v
                Flow Controller
                       |
       +---------------+---------------+
       |               |               |
   Processors      Connections     Services
       |               |               |
       +---------------+---------------+
                       |
                       v
               External Systems
```

The major concepts are:

- FlowFiles
- Processors
- Connections
- Relationships
- Process Groups
- Controller Services
- Parameter Contexts
- Provenance
- Reporting Tasks
- Backpressure

## FlowFiles

A FlowFile represents data moving through a NiFi flow.

It can be thought of as:

```text
FlowFile
+--------------------------------+
| CONTENT                        |
|                                |
| {"vehicle_id":"V001",...}      |
+--------------------------------+
| ATTRIBUTES                     |
| filename=vehicle.json          |
| source=kafka                   |
| vehicle_id=V001                |
| mime.type=application/json     |
+--------------------------------+
```

The content is the payload. Attributes are metadata used for routing,
processing, naming, logging and operational decisions.

## Processors

Processors perform operations.

Common categories include:

```text
Input
  -> files, databases, APIs, Kafka

Transformation
  -> conversion, enrichment, record processing

Routing
  -> attribute/content based routing

Output
  -> databases, files, Kafka, object storage
```

Example:

```text
GetFile
   |
   v
ValidateRecord
   |
   v
UpdateAttribute
   |
   v
PutDatabaseRecord
```

A processor normally has properties, scheduling configuration and
relationships.

## Connections

Connections link processors and contain queues.

```text
Processor A
     |
     v
+-------------+
|   QUEUE     |
| FlowFiles   |
+-------------+
     |
     v
Processor B
```

Queues provide buffering when an upstream processor is faster than a
downstream processor.

## Relationships

A processor can produce different outcomes.

```text
                 success
                    |
                    v
Processor ----------+------> Next Step
                    |
                 failure
                    |
                    v
                 Error Path
```

Important relationships should never be left unmanaged in a production flow.

## Process Groups

Process Groups organize related flows.

Example:

```text
Automobile Platform
|
+-- Vehicle Telemetry
+-- Dealer Data
+-- Warranty Data
+-- Service Records
+-- Customer Data
+-- Error Handling
+-- Monitoring
```

This makes large deployments easier to operate.

## Controller Services

Controller Services provide reusable shared configuration.

Examples include:

- database connection pools
- record readers
- record writers
- SSL contexts
- schema-related services
- distributed caches

Conceptually:

```text
             Controller Service
                    |
        +-----------+-----------+
        |           |           |
    Processor A Processor B Processor C
```

## Parameter Contexts

Parameter Contexts allow reusable configuration values.

Conceptual values:

```text
environment=dev
database.host=localhost
database.schema=raw
error.path=/data/errors
```

The same flow can use different values in development, testing and production.

## Data Provenance

Provenance records the history of FlowFiles.

```text
Created
  |
  v
Received
  |
  v
Processed
  |
  v
Routed
  |
  v
Stored
```

It helps answer:

- Where did this data come from?
- Which processor handled it?
- When did it move?
- What happened to it?
- Where was it sent?

This is extremely useful during troubleshooting and auditing.

## Backpressure

Backpressure prevents fast producers from overwhelming slow consumers.

```text
FAST PRODUCER
      |
      v
+-------------+
|    QUEUE    |
| BACKPRESSURE|
+-------------+
      |
      v
SLOW CONSUMER
```

When a queue reaches its configured threshold, NiFi can stop allowing more
data into that queue until the downstream consumer catches up.

## Routing

NiFi can route data based on FlowFile attributes or content.

```text
                  RouteOnAttribute
                         |
              +----------+----------+
              |                     |
            valid                 invalid
              |                     |
              v                     v
        Data Lake              Error Store
```

Example expression:

```text
${vehicle_id:isEmpty():not()}
```

This represents the idea of checking whether vehicle_id exists.

## Transformation

NiFi supports simple and record-oriented transformations.

Example:

Input:

```json
{
  "vehicle": "v001",
  "speed": "80"
}
```

Normalized output:

```json
{
  "vehicle_id": "V001",
  "speed_kmph": 80
}
```

For structured data, record-oriented processors can provide cleaner and more
maintainable processing than large chains of string operations.

## Database Integration

Typical pattern:

```text
Database
   |
   v
Fetch / Query
   |
   v
ConvertRecord
   |
   v
ValidateRecord
   |
   v
Data Lake / Kafka / API
```

For database writes:

```text
API
 |
 v
NiFi
 |
 v
ValidateRecord
 |
 v
PutDatabaseRecord
 |
 v
PostgreSQL
```

Credentials should be stored securely and never committed into Git.

## Kafka Integration

NiFi can consume from and publish to Kafka.

```text
Vehicle Sensors
      |
      v
    Kafka
      |
      v
 ConsumeKafka
      |
      v
 ValidateRecord
      |
      v
 Route
   /        v        v
Data Lake Error Topic
```

Kafka remains the event-streaming system. NiFi provides integration, routing,
validation and delivery capabilities around it.

## HTTP and API Integration

A typical API flow:

```text
InvokeHTTP
    |
    v
Validate Response
    |
    v
Transform
    |
    v
Route
```

Production API integrations should consider:

- authentication
- timeouts
- rate limits
- retries
- HTTP status codes
- malformed responses
- logging
- monitoring

## Error Handling

Failures should have an explicit path.

```text
                 +---- success ----> Destination
                 |
Processor -------+
                 |
                 +---- failure -----> Error Storage
                 |
                 +---- retry --------> Retry Queue
```

Useful error metadata includes:

```text
error.message
processor.name
timestamp
source
retry.count
original.filename
```

Preserving failed data is important because simply dropping it makes
troubleshooting and recovery difficult.

## Security

Production NiFi should use appropriate:

```text
HTTPS / TLS
Authentication
Authorization
Least Privilege
Secure Credentials
Audit Logging
```

Never expose an administrative NiFi interface to an untrusted network without
proper security controls.

## Clustering

NiFi can run as a cluster.

```text
                 Load Balancer
                      |
          +-----------+-----------+
          |           |           |
       NiFi 1      NiFi 2      NiFi 3
          |           |           |
          +-----------+-----------+
                      |
                Data Systems
```

Clustering can provide scalability and availability, depending on the
deployment architecture.

## Performance

Important metrics include:

```text
CPU
Memory
Disk I/O
Queue Depth
Processor Throughput
Processor Latency
External System Latency
FlowFile Count
Repository Health
```

Optimization should begin with measurement.

Useful practices:

- avoid unnecessary transformations
- reduce excessive FlowFile creation
- use appropriate processor concurrency
- monitor queue growth
- use efficient record processing
- avoid sending data repeatedly between unnecessary processors

## Monitoring

A production platform should monitor:

```text
Processor Health
Queue Depth
Throughput
Failures
CPU
Memory
Disk
Repository Health
Cluster Health
External-System Latency
```

Alerting should focus on conditions that require human action.

## Versioning

Important flows should be version-controlled.

A team should be able to answer:

```text
Who changed the flow?
What changed?
When was it changed?
Can we restore the previous version?
```

Development, testing and production flows should be promoted through a
controlled process.

## Automobile Industry Example

Connected vehicles may send telemetry such as:

```json
{
  "vehicle_id": "V001",
  "timestamp": "2026-08-27T10:30:00Z",
  "speed": 72,
  "engine_temperature": 91.2,
  "fuel_level": 61
}
```

A production-style architecture:

```text
Vehicle
   |
   v
Kafka
   |
   v
Apache NiFi
   |
   +------ invalid ------> Error Store
   |
   v
Data Lake
   |
   v
Spark
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

NiFi is the integration and flow-management layer. Kafka handles event
streaming, Spark handles distributed processing, dbt handles SQL
transformation, and BI tools consume analytical datasets.

## Best Practices

1. Use logical process groups.
2. Name processors clearly.
3. Handle important relationships.
4. Configure backpressure deliberately.
5. Reuse controller services.
6. Use parameter contexts.
7. Keep credentials out of source control.
8. Preserve failed data.
9. Monitor queues.
10. Version production flows.
11. Document important business logic.
12. Test with representative data.
13. Separate environments.
14. Apply least privilege.
15. Measure before optimizing.

## Common Mistakes

1. Creating one huge flow.
2. Ignoring failure paths.
3. Hard-coding passwords.
4. Ignoring queue growth.
5. Infinite retries.
6. No monitoring.
7. No version control.
8. Creating excessive FlowFiles.
9. Using NiFi for workloads better suited to Spark.
10. Treating NiFi as a replacement for Kafka or Airflow.

## Comparison

| Technology | Main Role |
|---|---|
| Apache NiFi | Data movement and integration |
| Apache Kafka | Event streaming |
| Apache Airflow | Workflow orchestration |
| Apache Spark | Distributed processing |
| Apache Flink | Stateful stream processing |
| dbt | SQL transformation |

These technologies commonly work together in a modern data platform.

## Interview Questions

### Beginner

1. What is Apache NiFi?
2. What is a FlowFile?
3. What is a Processor?
4. What is a Connection?
5. What is a Relationship?
6. What is a Process Group?
7. What is backpressure?
8. What is data provenance?

### Intermediate

9. What are Controller Services?
10. What are Parameter Contexts?
11. How does NiFi route data?
12. How does NiFi handle failures?
13. How does NiFi integrate with Kafka?
14. How does NiFi connect to databases?
15. How does NiFi provide provenance?

### Advanced

16. How would you design a NiFi cluster?
17. How would you troubleshoot growing queues?
18. How would you design retries?
19. When would you choose NiFi over Spark?
20. How would you secure production NiFi?
21. How would you design automobile telemetry ingestion?

## Cheat Sheet

```text
FlowFile          = Data + Attributes
Processor         = Performs an operation
Connection        = Queue between processors
Relationship      = Processor outcome
Process Group     = Logical flow container
Controller Service= Reusable shared service
Parameter Context = Reusable configuration
Provenance        = FlowFile history
Backpressure      = Queue protection
```

Basic pattern:

```text
Source -> Processor -> Queue -> Processor -> Destination
```

## Practical Exercise

Build:

```text
CSV File
   |
   v
GetFile
   |
   v
ConvertRecord
   |
   v
ValidateRecord
   |
   v
RouteOnAttribute
   |             |
   v             v
 Valid         Invalid
   |             |
   v             v
Database      Error Folder
```

Validation rules:

```text
vehicle_id -> required
service_date -> required
cost -> non-negative
```

Preserve invalid records and add source metadata.

## Final Takeaway

Apache NiFi is a visual, operational data-flow platform that makes data
movement, routing, transformation, buffering, provenance and integration
manageable.

It is most powerful when used as one layer in a broader data engineering
architecture rather than as a replacement for every other technology.
