# Parquet Row Groups

A Parquet file is divided into row groups.

```text
File
 ├── Row Group A
 ├── Row Group B
 └── Row Group C
```

Each row group contains chunks for the columns.

## Why row groups exist

They provide manageable units for:

- reading;
- statistics;
- parallel processing;
- data skipping.

## Example

Suppose a telemetry file contains three row groups:

```text
RG1 -> event_time Jan 1
RG2 -> event_time Jan 2
RG3 -> event_time Jan 3
```

A query for Jan 3 may be able to avoid reading RG1/RG2 if metadata allows the engine to prove
they cannot match.

## Important caveat

The benefit depends on:

- statistics;
- writer behavior;
- query engine;
- data distribution;
- filter selectivity.

## File sizing

Very small row groups can increase overhead.

Very large row groups can reduce flexibility and increase memory/retry cost.

There is no universal perfect value.

## Production method

Benchmark representative data rather than copying a configuration from another company.
