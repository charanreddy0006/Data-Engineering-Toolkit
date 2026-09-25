# 7. Ingestion Layer

Ingestion moves source data into the platform.

## Patterns
- batch extraction
- streaming
- CDC
- file transfer

## Responsibilities
Transport, schema handling, metadata, retries, validation and security.

```text
Source → Ingestion → Raw
```

## Automobile
Use streaming for connected-vehicle events and batch/CDC for slower-changing enterprise systems.

Do not force every source into one ingestion pattern.
