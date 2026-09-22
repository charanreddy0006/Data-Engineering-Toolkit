# 5. Data Ingestion

## Sources

- databases
- APIs
- files
- event streams
- applications
- feature stores

## Batch

```text
Operational DB → Scheduled Extract → Analytical Storage
```

## Streaming

```text
Vehicle → Event Gateway → Kafka → Stream Processor
```

## Preserve

- entity ID
- event timestamp
- ingestion timestamp
- source metadata
- schema

## Best practices

- validate schemas
- handle duplicates
- preserve raw records where practical
- monitor arrival
- isolate source failures

## Automobile sources

```text
Telemetry
Service Orders
Warranty Claims
Vehicle Master
Charging Sessions
```
