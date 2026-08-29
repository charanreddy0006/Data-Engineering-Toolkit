# 72 Data Skew

## Day 14 — Hadoop Ecosystem

## Overview

Apache Hadoop is a distributed data platform ecosystem designed for storing
and processing very large datasets across clusters of commodity or cloud
machines. Hadoop is best understood as a collection of components rather than
a single program.

The major Hadoop building blocks are HDFS, YARN, MapReduce and Hadoop Common.

```text
                         HADOOP
                           |
        +------------------+------------------+
        |                  |                  |
       HDFS               YARN            MapReduce
        |                  |                  |
   Distributed        Resource and       Batch Data
     Storage          Scheduling          Processing
        |
        +---- Hive
        +---- HBase
        +---- Hadoop Streaming
        +---- Avro / Parquet
```

## Why Hadoop Matters

A single server has practical limits for CPU, memory, storage and network
throughput. Hadoop distributes data and computation across multiple machines.

```text
Single Server
     |
     | Data grows
     v
Resource Limits
     |
     v
Distributed Cluster
     |
     v
Parallel Storage + Processing
```

This design also provides mechanisms for surviving individual machine
failures.

## HDFS

HDFS means Hadoop Distributed File System. It divides large files into blocks
and distributes those blocks across DataNodes.

```text
Large File
   |
   +---- Block 1 ----> DataNode 1
   +---- Block 2 ----> DataNode 2
   +---- Block 3 ----> DataNode 3
```

The NameNode maintains filesystem metadata while DataNodes store actual
blocks.

## HDFS Replication

HDFS can maintain multiple replicas of each block.

```text
                 Block A
                    |
          +---------+---------+
          |         |         |
          v         v         v
       DataNode 1 DataNode 2 DataNode 3
```

Replication increases availability and allows data to survive node failures.

## NameNode

The NameNode maintains the HDFS namespace and metadata such as file names,
directories, permissions and block locations.

It is a critical control-plane service.

```text
                 NameNode
                    |
        +-----------+-----------+
        |           |           |
        v           v           v
       DN1         DN2         DN3
```

## DataNode

A DataNode stores HDFS blocks and serves read/write requests.

DataNodes periodically report their health and block information to the
NameNode.

## Secondary NameNode

The Secondary NameNode is not a standby replacement for the NameNode.

Its traditional role is checkpointing filesystem metadata by periodically
combining the filesystem image and edit information.

High-availability deployments use dedicated HA mechanisms.

## HDFS Read Flow

```text
Client
  |
  v
NameNode
  |
  | block locations
  v
DataNode
  |
  v
Client reads block data
```

The NameNode supplies metadata while the client normally obtains actual data
from DataNodes.

## HDFS Write Flow

```text
Client
  |
  v
NameNode
  |
  | block allocation
  v
DataNode 1
  |
  v
DataNode 2
  |
  v
DataNode 3
```

A replication pipeline can write copies of a block to multiple DataNodes.

## HDFS Commands

```bash
hdfs dfs -ls /
hdfs dfs -mkdir -p /data/raw
hdfs dfs -put vehicles.csv /data/raw/
hdfs dfs -cat /data/raw/vehicles.csv
hdfs dfs -du -h /data/raw
hdfs dfs -get /data/raw/vehicles.csv .
hdfs dfs -rm /data/raw/vehicles.csv
```

Commands may differ slightly depending on Hadoop distribution and version.

## YARN

YARN means Yet Another Resource Negotiator. It provides cluster-level
resource management and application scheduling.

```text
                 ResourceManager
                        |
             +----------+----------+
             |                     |
             v                     v
       NodeManager            NodeManager
             |                     |
        Containers             Containers
```

YARN allows different distributed applications to share cluster resources.

## ResourceManager

The ResourceManager is the central YARN service. It handles resource
allocation and scheduling at cluster level.

Typical responsibilities include:

- application submission
- resource scheduling
- queue management
- cluster resource tracking

## NodeManager

A NodeManager runs on each worker node.

It launches and monitors containers and reports node status to the
ResourceManager.

```text
Worker Node
 |
 +-- NodeManager
 +-- Container
 +-- Container
 +-- Container
```

## ApplicationMaster

An ApplicationMaster coordinates one application.

```text
Client
  |
  v
ResourceManager
  |
  v
ApplicationMaster
  |
  +---- Container
  +---- Container
  +---- Container
```

The exact execution process depends on the application framework.

## MapReduce

MapReduce is a distributed batch-processing programming model.

```text
Input
  |
  v
Map
  |
  v
Shuffle + Sort
  |
  v
Reduce
  |
  v
Output
```

The mapper processes input records and the reducer processes grouped
intermediate results.

## Mapper

A mapper converts input records into intermediate key-value pairs.

Example:

```text
Input:
car car truck

Mapper output:
(car, 1)
(car, 1)
(truck, 1)
```

## Reducer

The reducer receives grouped values:

```text
(car, [1, 1])
(truck, [1])
```

and can produce:

```text
(car, 2)
(truck, 1)
```

## Combiner

A combiner can perform local aggregation before data is transferred during
shuffle.

```text
Mapper
  |
  v
Combiner
  |
  v
Shuffle
  |
  v
Reducer
```

A combiner is optional and must only be used for operations where local
aggregation is safe.

## Partitioner

The partitioner decides which reducer receives an intermediate key.

```text
                 Key
                  |
                  v
             Partitioner
             /    |    \
            v     v     v
          R0      R1     R2
```

Poor partitioning can create uneven reducer workloads.

## MapReduce Execution

```text
Input Files
     |
     v
Input Splits
     |
     v
Map Tasks
     |
     v
Intermediate Data
     |
     v
Shuffle / Sort
     |
     v
Reduce Tasks
     |
     v
Output Files
```

## Hadoop Streaming

Hadoop Streaming allows external programs to act as mapper and reducer
processes. Python is commonly used for learning and simple streaming jobs.

```text
Input
  |
  v
Python Mapper
  |
  v
Shuffle
  |
  v
Python Reducer
  |
  v
Output
```

## Python Mapper Example

```python
#!/usr/bin/env python3
import sys

for line in sys.stdin:
    for word in line.strip().split():
        print(f"{word.lower()}\t1")
```

## Python Reducer Example

```python
#!/usr/bin/env python3
import sys

current_word = None
total = 0

for line in sys.stdin:
    word, value = line.rstrip().split("\t", 1)
    value = int(value)

    if current_word is not None and word != current_word:
        print(f"{current_word}\t{total}")
        total = 0

    current_word = word
    total += value

if current_word is not None:
    print(f"{current_word}\t{total}")
```

## Hadoop Configuration

Common configuration files are:

```text
core-site.xml
hdfs-site.xml
yarn-site.xml
mapred-site.xml
```

They configure filesystem defaults, HDFS behavior, YARN and MapReduce.

Example:

```xml
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://namenode:9000</value>
    </property>
</configuration>
```

Actual production configuration must match the deployed cluster.

## HDFS High Availability

High availability can use active and standby NameNode roles.

```text
                 Client
                    |
          +---------+---------+
          |                   |
          v                   v
   Active NameNode     Standby NameNode
          |                   |
          +---------+---------+
                    |
                 DataNodes
```

The exact HA mechanism depends on Hadoop version and deployment design.

## Security

A production Hadoop environment should consider:

```text
Authentication
Authorization
Encryption
ACLs
Audit Logging
Network Security
Secret Management
```

Kerberos is widely associated with Hadoop authentication.

## Kerberos

Simplified flow:

```text
User
 |
 v
Kerberos
 |
 v
Authentication Ticket
 |
 v
Hadoop Service
```

Real deployments require careful principal, keytab, time synchronization and
service configuration.

## ACLs

HDFS Access Control Lists provide more granular permissions.

```text
File
 |
 +-- Owner
 +-- Group
 +-- ACL Entry
 +-- ACL Entry
```

Use least-privilege access.

## Quotas

HDFS quotas can control storage and namespace usage.

```text
Department
 |
 +-- Storage Quota
 +-- Namespace Quota
```

Quotas prevent a single workload from consuming uncontrolled resources.

## Compression

Compression reduces storage and data-transfer requirements.

Common choices:

```text
Gzip
Snappy
LZ4
Bzip2
Zstandard
```

The correct choice depends on CPU overhead, compression ratio and workload.

## Storage Formats

Hadoop ecosystems can work with:

```text
Text
SequenceFile
Avro
Parquet
ORC
```

For analytical workloads, columnar formats such as Parquet and ORC are often
preferred.

## Hive

Hive provides SQL-oriented analytics over distributed storage.

```text
HDFS / Data Lake
       |
       v
      Hive
       |
       v
       SQL
       |
       v
    Results
```

Hive is an important historical and current component in Hadoop-oriented
data platforms.

## Spark

Spark can use Hadoop infrastructure such as HDFS and YARN.

```text
YARN
  |
  v
Spark
  |
  v
HDFS
```

Spark and Hadoop are complementary rather than direct replacements in every
architecture.

## Kafka

Kafka can act as an event-ingestion layer.

```text
Vehicles
   |
   v
 Kafka
   |
   v
Hadoop / Spark
   |
   v
Data Lake
```

Kafka handles event transport while Hadoop components can provide storage and
batch processing.

## HBase

HBase is a distributed wide-column database associated with the Hadoop
ecosystem.

It is suitable for access patterns requiring random and relatively
low-latency reads/writes rather than traditional sequential batch analytics.

## HBase Data Model

```text
Row Key
 |
 +-- Column Family
       |
       +-- Qualifier
       +-- Qualifier
```

Good row-key design is essential for avoiding hotspots and achieving useful
access patterns.

## Oozie

Oozie was designed for workflow scheduling in Hadoop environments.

Modern data platforms frequently use Airflow or managed cloud orchestration,
but Oozie is useful for understanding traditional Hadoop architecture.

## Small Files Problem

HDFS is optimized for large files. Very large numbers of tiny files create
metadata pressure and can reduce efficiency.

```text
Bad:
file1
file2
file3
...
file1,000,000

Better:
larger managed files
```

Compaction and sensible file sizing help address this problem.

## Data Skew

Data skew occurs when some keys receive much more data than others.

```text
Reducer 0  █████████████████
Reducer 1  ██
Reducer 2  █
Reducer 3  ██
```

The overloaded reducer can become the overall job bottleneck.

Possible approaches include better partitioning, pre-aggregation, salting
and redesigning the key distribution.

## Performance

Important performance factors include:

- block and file sizes
- storage layout
- replication
- network throughput
- CPU
- memory
- partitioning
- shuffle volume
- data skew
- compression

Performance tuning should begin with measurement rather than random
configuration changes.

## Fault Tolerance

Distributed systems expect individual machines to fail.

```text
DataNode 1
    X
 Failure
    |
    v
Replica on DataNode 2
    |
    v
Data remains available
```

HDFS replication is a fundamental availability mechanism.

## Disaster Recovery

A production platform should have:

- metadata backups
- recovery procedures
- tested restoration
- documented RPO/RTO
- secondary environments where required
- regular recovery exercises

A backup is not a complete disaster-recovery strategy until restoration has
been tested.

## Cloud Hadoop

Cloud platforms provide managed Hadoop-related services.

```text
Cloud Storage
     |
     v
Managed Cluster
     |
 +---+---+
 |       |
Hadoop  Spark
 |
 v
Analytics
```

Cloud environments reduce some infrastructure work but require careful
attention to IAM, networking, storage and cost.

## AWS EMR

Amazon EMR provides managed clusters for Hadoop, Spark and related big-data
technologies.

```text
S3
 |
 v
EMR
 |
 +-- Hadoop
 +-- Spark
 +-- Hive
 |
 v
Analytics
```

## Azure HDInsight

Azure HDInsight provides managed big-data cluster services.

Production designs should use the current Azure service documentation because
supported components and capabilities can change.

## Google Cloud Dataproc

Dataproc provides managed Hadoop and Spark cluster capabilities.

```text
Cloud Storage
     |
     v
Dataproc
     |
     v
Analytics
```

## Automobile Industry Example

Connected vehicles generate telemetry such as:

```json
{
  "vehicle_id": "V001",
  "timestamp": "2026-08-29T10:30:00Z",
  "speed": 72,
  "engine_temperature": 91.2,
  "fuel_level": 61
}
```

A Hadoop-oriented architecture can be:

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
HDFS / Data Lake
      |
 +----+-----------+
 |                |
 v                v
Hive          Spark / MapReduce
 |                |
 +-------+--------+
         |
         v
Curated Analytics
         |
         v
Warehouse / BI / ML
```

Possible analytical outputs include vehicle utilization, abnormal
temperature events, fuel trends and maintenance indicators.

## Production Architecture

```text
                         Data Sources
                              |
                +-------------+-------------+
                |                           |
                v                           v
             Kafka                    Batch Sources
                |                           |
                +-------------+-------------+
                              |
                              v
                       Distributed Storage
                              |
                  +-----------+-----------+
                  |                       |
                  v                       v
                 HDFS                    YARN
                  |                       |
             +----+----+            +-----+-----+
             |         |            |           |
            Hive      Spark      MapReduce    Other Apps
             |         |
             +----+----+
                  |
                  v
           Curated Datasets
                  |
                  v
            Warehouse / BI / ML
```

Production systems also require monitoring, security, logging, backup,
capacity planning and disaster recovery.

## Best Practices

1. Separate storage, resource management and processing responsibilities.
2. Avoid excessive small files.
3. Monitor NameNode and DataNode health.
4. Plan storage capacity before growth becomes critical.
5. Select compression based on workload.
6. Prefer suitable columnar formats for analytics.
7. Use least-privilege permissions.
8. Secure credentials and key material.
9. Monitor YARN queues and resources.
10. Test disaster recovery.
11. Document configuration.
12. Measure before optimizing.
13. Watch for data skew.
14. Automate repeatable operations.
15. Keep architecture documentation current.

## Common Mistakes

- Treating Secondary NameNode as a backup NameNode.
- Creating millions of tiny files.
- Ignoring NameNode metadata capacity.
- Choosing replication without requirements analysis.
- Ignoring data skew.
- Hard-coding passwords.
- Failing to test recovery.
- Running clusters without monitoring.
- Confusing HDFS, YARN and MapReduce responsibilities.
- Using legacy components without checking their current operational role.

## Advantages

- Distributed storage
- Horizontal scalability
- Fault tolerance
- Parallel processing
- Data locality
- Large ecosystem
- Integration with Hive, Spark and HBase
- Strong historical importance in big-data engineering

## Limitations

- Operational complexity
- Administration overhead
- HDFS is not ideal for every workload
- Small-files problem
- Resource-management complexity
- Legacy components may require careful lifecycle planning
- Cloud object storage has replaced some traditional HDFS deployments

## Comparison

| Technology | Primary Role |
|---|---|
| HDFS | Distributed storage |
| YARN | Resource management |
| MapReduce | Distributed batch processing |
| Spark | General distributed processing |
| Hive | SQL analytics |
| HBase | Wide-column database |
| Kafka | Event streaming |

## Interview Questions

### Beginner

1. What is Hadoop?
2. What is HDFS?
3. What is YARN?
4. What is MapReduce?
5. What is a NameNode?
6. What is a DataNode?
7. What is an HDFS block?
8. Why is replication used?

### Intermediate

9. Explain HDFS read flow.
10. Explain HDFS write flow.
11. Explain YARN architecture.
12. What is an ApplicationMaster?
13. What is a shuffle?
14. What is a combiner?
15. What is Hadoop Streaming?
16. Why is the small-files problem important?

### Advanced

17. How would you design HDFS high availability?
18. How would you diagnose NameNode issues?
19. How would you handle data skew?
20. How would you plan cluster capacity?
21. Hadoop versus Spark?
22. How would you design automobile telemetry storage?
23. How would you secure an enterprise Hadoop cluster?

## Cheat Sheet

```text
Hadoop       = Big-data ecosystem
HDFS         = Distributed filesystem
NameNode     = HDFS metadata manager
DataNode     = HDFS block storage
Block        = HDFS storage unit
Replication  = Multiple block copies
YARN         = Resource management
RM           = ResourceManager
NM           = NodeManager
AM           = ApplicationMaster
Container    = Allocated execution resources
Mapper       = Intermediate processing
Reducer      = Aggregation/output
Shuffle      = Intermediate redistribution
Combiner     = Optional local aggregation
Hive         = SQL analytics
HBase        = Wide-column database
Kafka        = Event streaming
```

## Mini Project

### Automobile Telemetry Data Lake

Use the following fields:

```text
vehicle_id
event_time
speed
engine_temperature
fuel_level
latitude
longitude
```

Pipeline:

```text
Telemetry
    |
    v
Kafka
    |
    v
HDFS Raw Zone
    |
    v
Validation
    |
    v
Hive / Spark
    |
    v
Curated Zone
```

Calculate:

```text
events per vehicle
average speed
maximum engine temperature
average fuel level
daily event volume
```

## End-to-End Project

Build a Hadoop-oriented automobile analytics platform.

```text
Vehicles
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
   +----------+-----------+
   |          |           |
   v          v           v
  Hive      Spark     MapReduce
   |          |           |
   +----------+-----------+
              |
              v
       Curated Data Lake
              |
              v
        Warehouse / BI
              |
              v
             ML
```

Project requirements:

- ingest telemetry
- store raw events
- partition analytical datasets
- validate records
- calculate vehicle metrics
- control file sizes
- monitor cluster health
- implement access controls
- document failure recovery
- produce analytical outputs

## Final Revision Checklist

```text
[ ] Hadoop Fundamentals
[ ] Hadoop Architecture
[ ] Hadoop Common
[ ] HDFS
[ ] NameNode
[ ] DataNode
[ ] Blocks
[ ] Replication
[ ] HDFS Read Flow
[ ] HDFS Write Flow
[ ] HDFS HA
[ ] HDFS Federation
[ ] HDFS Commands
[ ] YARN
[ ] ResourceManager
[ ] NodeManager
[ ] ApplicationMaster
[ ] Containers
[ ] Scheduling
[ ] MapReduce
[ ] Mapper
[ ] Reducer
[ ] Combiner
[ ] Partitioner
[ ] Shuffle
[ ] Hadoop Streaming
[ ] Configuration
[ ] Security
[ ] Kerberos
[ ] ACLs
[ ] Quotas
[ ] Encryption
[ ] Compression
[ ] SequenceFile
[ ] Avro
[ ] Parquet
[ ] Hive
[ ] Spark
[ ] Kafka
[ ] HBase
[ ] Oozie
[ ] Monitoring
[ ] Performance
[ ] Data Skew
[ ] Small Files
[ ] Fault Tolerance
[ ] Disaster Recovery
[ ] Cloud
[ ] Automobile Project
```

## Conclusion

Hadoop is best understood as an ecosystem with clearly separated
responsibilities.

```text
HDFS        -> Distributed Storage
YARN        -> Resource Management
MapReduce   -> Distributed Batch Processing
Hive        -> SQL Analytics
HBase       -> Wide-Column Database
Kafka       -> Event Streaming
Spark       -> Distributed Processing
```

The goal of Day 14 is to understand both the individual Hadoop components and
how they fit into a complete data-engineering architecture.
