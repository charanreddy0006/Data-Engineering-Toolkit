# 32. Data Quality Architecture

Quality checks should exist at important boundaries.

```text
Source
 ↓
Ingestion Validation
 ↓
Staging Validation
 ↓
Transformation Validation
 ↓
Serving Validation
```

## Dimensions
- completeness
- validity
- uniqueness
- consistency
- freshness
- accuracy

## Automobile
Invalid vehicle identifiers can break joins across telemetry, service and warranty datasets.

## Principle
Detect errors early, but also validate important business outputs before consumers rely on them.
