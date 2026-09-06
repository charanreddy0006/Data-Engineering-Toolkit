# What Is Data Modeling?

Data modeling describes the structure, relationships, constraints, semantics, history, and physical
organization of data.

It is both a technical design activity and a communication mechanism.

## Why not just create tables?

Without a model, teams often design around immediate source files:

```text
vehicle_data
vehicle_data_2
service_data_final
service_data_final_v2
```

The result can contain duplicate business concepts, unclear ownership, inconsistent definitions,
and fragile joins.

A model asks what the business objects actually are.

## Three levels

### Conceptual

Business vocabulary:

```text
Customer owns Vehicle
Vehicle makes Trip
Vehicle produces Telemetry
Vehicle receives Service
```

### Logical

Adds:

- attributes;
- keys;
- cardinality;
- optionality;
- relationship rules.

### Physical

Adds:

- database engine;
- data types;
- indexes;
- partitions;
- clustering;
- constraints;
- storage strategy.

## Automobile example

A vehicle and a trip are different grains.

```text
Vehicle V100
  ├── Trip T1
  ├── Trip T2
  └── Trip T3
```

A trip can have many telemetry events:

```text
Trip T1
  ├── Event E1
  ├── Event E2
  └── Event E3
```

Combining all three into one table without a clear grain creates fan-out risk.

## Core questions

Before creating a model:

1. What is the business process?
2. What does one row represent?
3. What identifies it?
4. What relationships exist?
5. Which values can change?
6. Is historical truth required?
7. What queries will consume it?

## Key principle

> Model business meaning first and physical storage second.
