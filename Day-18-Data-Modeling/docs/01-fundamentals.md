# Data Modeling Fundamentals


## What Is Data Modeling?

Data modeling is the formal process of describing data objects, their
properties, relationships, business rules, and storage representation.

A model is a communication contract between business users, application
developers, data engineers, analysts, and database administrators.

## Why Modeling Exists

Without modeling, teams often create tables independently. This leads to:

- multiple meanings for the same column
- duplicated customer records
- inconsistent identifiers
- incompatible date definitions
- unclear ownership
- difficult historical reporting
- fragile pipelines

For example, five systems might represent a vehicle differently:

```text
CRM:       customer_vehicle_id
Dealer:    vehicle_no
IoT:       vin
Service:   asset_id
Warehouse: vehicle_key
```

A data model defines how these identifiers relate.

## Three Levels

### Conceptual

Shows business concepts.

```text
Customer → Vehicle → Service
             |
            Model
```

### Logical

Adds attributes, relationships, keys and cardinality.

### Physical

Adds implementation details:

- data types
- indexes
- partitions
- constraints
- storage format
- clustering
- distribution

## Modeling Is a Design Activity

A table is not automatically a model.

A good model explains:

```text
What the data means
Who owns it
How it relates
When it is valid
How it changes
How it is consumed
```

## Business Process First

Consider vehicle servicing.

Possible events:

```text
Appointment Created
Vehicle Checked In
Diagnosis Started
Repair Started
Repair Completed
Invoice Issued
Vehicle Collected
```

A model must decide whether the requirement is:

```text
One row per service order
```

or:

```text
One row per service event
```

Those are different grains.

## Model Quality Dimensions

A useful model should be:

### Correct

It represents the business accurately.

### Consistent

The same concept has the same meaning.

### Complete

Required entities and relationships are represented.

### Understandable

A new analyst can use it without guessing.

### Maintainable

Changes can be introduced without breaking everything.

### Scalable

The design remains practical as data volume grows.

## Questions to Ask

Before creating a table:

1. What is the business process?
2. What is the entity?
3. What is the event?
4. What identifies it?
5. What attributes describe it?
6. What relationships exist?
7. What is the grain?
8. What history is required?
9. What is the expected query pattern?
10. What quality rules are required?

## Modeling Anti-Pattern

Bad:

```text
CREATE TABLE everything (
    customer_name,
    vehicle_model,
    service_cost,
    telemetry_speed,
    sale_amount
);
```

This mixes multiple business processes and grains.

Better:

```text
CUSTOMER
VEHICLE
FACT_SALES
FACT_SERVICE
FACT_TELEMETRY
```

## Data Engineer's Responsibility

Data engineers should not treat modeling as only a database administrator's
job. Pipeline design, transformations, warehouse schemas, lakehouse tables,
and downstream contracts all depend on modeling decisions.

## Practical Exercise

Choose an automobile service center and list:

```text
Entities
Attributes
Relationships
Events
Business identifiers
Historical attributes
Measures
```

Then write one sentence describing the grain of each event.
