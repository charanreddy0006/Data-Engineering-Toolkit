# Day 23 — File Formats 📦🚗

A detailed Data Engineering learning module about how data is represented, exchanged,
serialized, compressed, stored, partitioned, validated, and consumed.

## Core formats

```text
Text / interchange
CSV • TSV • JSON • JSONL • XML • YAML

Serialization
Avro • Protobuf concepts

Analytical columnar
Parquet • ORC

Business files
XLSX

Supporting concerns
Encoding • compression • schema • partitioning • metadata • evolution
```

## Why file formats matter

A file format affects:

- storage size;
- read/write performance;
- type fidelity;
- schema management;
- interoperability;
- compression;
- parallelism;
- query optimization;
- evolution;
- recovery.

## Central architecture

```text
Source system
    ↓
Interchange format
    ↓
Raw storage
    ↓
Validation + canonicalization
    ↓
Analytical format
    ↓
Partitioned dataset
    ↓
Warehouse / lakehouse
    ↓
BI / ML / APIs
```

## Automobile domain 🚗

Examples throughout this module use:

- vehicle master;
- connected-vehicle telemetry;
- trips;
- faults;
- service;
- warranty;
- EV charging;
- manufacturing.

## Golden rule

> Choose the format for the workload and contract, not because a file extension is popular.

## Completion target

By the end, you should be able to explain why JSON may be excellent at an API boundary while
Parquet is usually a better candidate for large analytical storage, why Avro is useful for
schema-driven serialization, how ORC compares with Parquet, and how partitioning/compression/
file sizing influence real production performance.
