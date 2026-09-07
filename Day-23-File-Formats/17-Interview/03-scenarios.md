# File Formats Interview — Scenarios

## Scenario: 5 TB CSV

Preserve raw data if required, validate it, and create an analytical representation such as
Parquet for repeated large-scale queries.

## Scenario: 200,000 tiny Parquet files

Investigate ingestion batching and partition cardinality, then compact and tune writers.

## Scenario: new telemetry field

Classify the change, update the contract if compatible, test consumers, and version/document it.

## Scenario: one malformed JSONL line

Record the line/source/error and quarantine according to policy rather than silently discarding it.

## Scenario: spreadsheet contains IDs with leading zeros

Read identifiers as strings and validate their expected format.

## Scenario: speed changes from km/h to mph

Treat as a semantic breaking change, not a harmless type change.
