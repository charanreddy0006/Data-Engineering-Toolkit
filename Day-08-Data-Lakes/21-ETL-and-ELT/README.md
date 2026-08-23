# 21 — ETL and ELT in Data Lakes

## ETL

```text
Extract
  |
Transform
  |
Load
```

Data is transformed before it reaches the destination.

## ELT

```text
Extract
  |
Load
  |
Transform
```

Raw data is loaded first and transformed later.

## Why ELT Fits Lakes

A lake can retain raw data cheaply and apply transformations according to
different downstream requirements.

## Example

```text
PostgreSQL
   |
   v
Raw Lake
   |
   +--> Sales Transformation
   +--> Customer Transformation
   +--> ML Transformation
```

## Key Advantage

If business logic changes, raw data can be processed again without extracting
the original source system from scratch.
