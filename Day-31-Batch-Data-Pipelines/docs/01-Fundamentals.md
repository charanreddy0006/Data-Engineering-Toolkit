# 1. Batch Data Pipeline Fundamentals

Batch processing handles a group of records together rather than processing every event immediately.

## Common uses
- daily sales loads
- nightly warehouse refreshes
- monthly finance processing
- daily ML scoring
- historical aggregations

## Typical flow

```text
Source → Extract → Stage → Transform → Validate → Load
```

## Why batch?

Batch is useful when the business does not require continuous processing. It can simplify operations and reduce cost for workloads that can wait.

## Pipeline contract

Define:
- source
- batch window
- expected output
- success criteria
- failure behavior
- rerun strategy

## Automobile example 🚗

Process all dealer service orders from the previous day, calculate service revenue and publish a curated service table.
