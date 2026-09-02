# Production Architecture Notes

```mermaid
flowchart LR
    A[Vehicle IoT] --> B[Kafka]
    C[CRM] --> D[Ingestion]
    E[Dealer DB] --> D
    F[Service DB] --> D
    B --> G[Bronze]
    D --> G
    G --> H[Silver]
    H --> I[Gold]
    I --> J[Warehouse]
    J --> K[BI]
    J --> L[ML]
```

## Responsibilities

### Ingestion

Capture source records reliably.

### Bronze

Preserve raw information.

### Silver

Clean and standardize.

### Gold

Create business-oriented models.

### Warehouse

Serve analytical workloads.

### BI

Expose metrics and dimensions.

## Failure Scenarios

```text
Kafka delay
Source outage
Duplicate event
Late event
Schema change
Bad dimension
Incorrect transformation
```

Every production model should define how these scenarios are handled.

## Monitoring

Monitor:

```text
Freshness
Row counts
Duplicate rate
Null rate
Pipeline duration
Source lag
Failed records
Schema changes
```
