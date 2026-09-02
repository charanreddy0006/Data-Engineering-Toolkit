# Mini Project — Automobile Sales Star Schema

## Goal

Create a small analytical warehouse for vehicle sales.

## Requirements

The model must answer:

1. Monthly revenue
2. Revenue by manufacturer
3. Units by dealer
4. Revenue by customer segment
5. Average sale amount by model

## Required Dimensions

```text
DIM_DATE
DIM_VEHICLE
DIM_CUSTOMER
DIM_DEALER
```

## Required Fact

```text
FACT_SALES
```

## Grain

> One row = one completed vehicle sale transaction.

## Tasks

### Task 1

Create the tables.

### Task 2

Insert at least:

```text
10 customers
10 vehicles
5 dealers
20 sales
```

### Task 3

Write five analytical queries.

### Task 4

Add a data-quality query for:

```text
duplicate VIN
null customer
negative amount
invalid date
```

### Task 5

Add one SCD Type 2 example for vehicle ownership.

## Expected Architecture

```text
OLTP-style source
      ↓
Staging
      ↓
Dimensions
      ↓
FACT_SALES
      ↓
Analytical Queries
```

## Completion Criteria

The model should have:

```text
Clear grain
Primary keys
Foreign keys
Appropriate data types
Quality checks
Useful analytical queries
Documented assumptions
```
