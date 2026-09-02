# Day 18 — Data Modeling

> A detailed, production-oriented learning module for Data Engineering.

Data modeling is the discipline of turning business requirements into a
well-defined structure for storing, integrating, transforming, querying, and
governing data.

This module is intentionally practical. It moves from relational modeling to
analytical modeling and then to production data-platform patterns.

---

## 1. Learning Objective

By the end of this module you should be able to:

- explain why data modeling exists
- identify entities, attributes, relationships, and cardinality
- create conceptual, logical, and physical models
- choose primary, foreign, natural, and surrogate keys
- normalize an OLTP model
- intentionally denormalize an analytical model
- distinguish OLTP and OLAP workloads
- design a dimensional model
- define fact-table grain before adding measures
- design fact and dimension tables
- build star and snowflake schemas
- choose SCD strategies
- understand advanced dimensional patterns
- model many-to-many relationships
- understand Data Vault hubs, links, and satellites
- model Bronze/Silver/Gold lakehouse layers
- design data models for batch and streaming data
- apply quality, governance, security, and performance practices
- build an automobile-industry warehouse model
- explain modeling decisions in interviews

---

## 2. The Central Mental Model

Always move through this sequence:

```text
Business Requirement
        ↓
Business Process
        ↓
Entities / Events
        ↓
Grain
        ↓
Relationships
        ↓
Keys
        ↓
Facts + Dimensions
        ↓
Historical Requirements
        ↓
Physical Design
        ↓
Quality / Governance
        ↓
Performance
```

A common beginner mistake is to start with SQL:

```text
"Which columns should I create?"
```

A stronger approach starts with:

```text
"What business event am I representing?"
"What does one row mean?"
```

---

## 3. Automobile Case Study

Throughout the module, use this running scenario:

An automobile company operates dealerships, sells vehicles, services vehicles,
provides warranty support, and receives connected-car telemetry.

Core business objects:

```text
Customer
Vehicle
Vehicle Model
Dealer
Sale
Service Order
Warranty Claim
Trip
Telemetry Event
Location
```

Example analytical questions:

```text
1. How much revenue did each model generate?
2. Which dealers sold the most vehicles?
3. Which regions have the highest service cost?
4. Which vehicles generate frequent fault events?
5. What is average daily distance by vehicle model?
6. How has vehicle ownership changed over time?
7. Which models have the highest warranty claim rate?
8. What is monthly EV charging utilization?
```

---

## 4. Architecture

```text
                    OPERATIONAL SYSTEMS
       +------------------------------------------+
       | CRM | Dealer DB | Service | Vehicle IoT |
       +----------------------+-------------------+
                              |
                    CDC / ETL / Streaming
                              |
                              v
                     RAW / BRONZE LAYER
                              |
                     Cleaning + Standardization
                              |
                              v
                     SILVER / INTEGRATION
                              |
                    Business Transformations
                              |
                              v
                     GOLD / ANALYTICS
                              |
               +--------------+---------------+
               |              |               |
              BI          Data Science       APIs
```

The important lesson is that a single enterprise rarely uses one model for
every layer.

---

## 5. Repository Structure

```text
Day-18-Data-Modeling/
├── README.md
├── docs/
│   ├── 01-fundamentals.md
│   ├── 02-conceptual-logical-physical.md
│   ├── 03-entities-relationships.md
│   ├── 04-keys-constraints.md
│   ├── 05-normalization.md
│   ├── 06-denormalization.md
│   ├── 07-oltp-vs-olap.md
│   ├── 08-dimensional-modeling.md
│   ├── 09-fact-tables.md
│   ├── 10-dimension-tables.md
│   ├── 11-grain.md
│   ├── 12-star-schema.md
│   ├── 13-snowflake-schema.md
│   ├── 14-scd.md
│   ├── 15-advanced-patterns.md
│   ├── 16-data-vault.md
│   ├── 17-lakehouse-modeling.md
│   ├── 18-streaming-modeling.md
│   ├── 19-physical-design.md
│   ├── 20-quality-governance.md
│   ├── 21-dbt-modeling.md
│   ├── 22-automobile-case-study.md
│   ├── 23-production-architecture.md
│   ├── 24-best-practices.md
│   ├── 25-common-mistakes.md
│   ├── 26-comparison.md
│   ├── 27-interview-questions.md
│   ├── 28-cheat-sheet.md
│   └── 29-resources.md
├── examples/
├── mini-project/
└── end-to-end-project/
```

---

## 6. How to Study This Folder

Do not read every file as isolated theory.

Use this progression:

```text
Days/Session 1:
Fundamentals → Entities → Keys → Normalization

Session 2:
OLTP/OLAP → Dimensional Modeling → Grain

Session 3:
Facts → Dimensions → Star → Snowflake

Session 4:
SCD → Advanced Patterns → Data Vault

Session 5:
Lakehouse → Streaming → Physical Design

Session 6:
Quality → Governance → dbt

Session 7:
Automobile Case Study → Project → Interview Questions
```

For every topic, reproduce at least one model on paper.

---

## 7. The Most Important Rule

### Define the grain before designing the fact table.

For example:

```text
FACT_SALES
One row = one completed vehicle sale
```

Then every measure must make sense at that grain.

This prevents a large class of analytical errors such as:

- duplicated revenue
- incorrect counts
- join multiplication
- invalid aggregations
- mixed-grain facts

---

## 8. Expected Final Skill

You should be able to receive a requirement such as:

> "Build a warehouse for vehicle sales and service analytics."

and independently produce:

```text
Business Process
       ↓
Grain
       ↓
Dimensions
       ↓
Facts
       ↓
Keys
       ↓
History Strategy
       ↓
Physical Design
       ↓
Quality Rules
       ↓
Analytical Queries
```

That is the real goal of this Day 18 module.
