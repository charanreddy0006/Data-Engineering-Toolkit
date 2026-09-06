# Day 22 — Data Modeling 🚗📊

A detailed, production-oriented Data Modeling module for Data Engineering.

## Learning goals

By completing this folder you should be able to:

- explain conceptual, logical, and physical data models;
- identify entities, attributes, relationships, cardinality, and optionality;
- select natural, surrogate, composite, primary, and foreign keys;
- apply normalization without blindly over-normalizing;
- distinguish OLTP and OLAP modeling;
- design facts, dimensions, grain, star and snowflake schemas;
- implement SCD Types 0–3 and hybrid history;
- model snapshots, bridges, factless facts, and role-playing dimensions;
- understand Data Vault, lakehouse, medallion, and event modeling;
- design for late-arriving data and schema evolution;
- choose indexes, partitioning, and clustering from workload patterns;
- define data-quality and governance rules;
- structure dbt models and tests;
- design a connected-vehicle analytics platform.

## The most important rule

> **Define the grain before designing a fact table or writing analytical joins.**

A query can be valid SQL and still be business-invalid when it crosses incompatible grains.

## Automobile domain

Throughout the module we model:

```text
Customer
Vehicle
Vehicle Model
Dealer
Trip
Telemetry Event
Fault Event
Service Order
Part
Warranty Claim
Charging Session
Manufacturing Event
```

Example event relationships:

```text
Customer
   │
   └── Ownership ── Vehicle
                       ├── Trips
                       ├── Telemetry
                       ├── Faults
                       ├── Service
                       └── Charging
```

## Module map

```text
01-Foundations
02-Entities-Relationships
03-Keys-Constraints
04-Normalization
05-Denormalization
06-OLTP-OLAP
07-Dimensional-Modeling
08-Facts-Dimensions-Grain
09-Star-Snowflake
10-SCD
11-Advanced-Warehouse-Patterns
12-Data-Vault
13-Lakehouse
14-Streaming-Modeling
15-Physical-Design
16-Quality-Governance
17-dbt-Modeling
18-Automobile-Case-Study
19-Production-Architecture
20-Projects
21-Troubleshooting
22-Comparisons
23-Interview
24-Cheat-Sheets
25-Resources
examples
automobile-project
```

## Production mindset

For every model ask:

1. What does one row mean?
2. What uniquely identifies it?
3. Which business process owns it?
4. What relationships exist?
5. Does history matter?
6. Can records arrive late or twice?
7. What happens when the source schema changes?
8. How will users query it?
9. How will quality be tested?
10. How can it be rebuilt after failure?

## Learning order

Foundations → relational design → normalization → OLTP/OLAP → dimensional modeling → SCD →
advanced patterns → modern lakehouse/streaming → physical design → governance → automobile project.

## Final portfolio output

The folder contains SQL DDL, analytical queries, ER diagrams, sample data, SCD examples, quality
checks, dbt-oriented patterns, production architecture, troubleshooting, interview questions,
cheat sheets, and an end-to-end automobile modeling project.
