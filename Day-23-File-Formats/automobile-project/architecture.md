# Production Automobile File Architecture

```mermaid
flowchart TD
    V[Connected Vehicles] --> A[Ingestion]
    D[Dealer] --> A
    M[Manufacturing] --> A
    W[Warranty] --> A

    A --> B[Bronze Source Files]
    B --> Q[Schema + Quality]
    Q --> S[Silver Parquet]

    S --> P1[Partition by business date]
    P1 --> G1[Gold Trip]
    P1 --> G2[Gold Telemetry]
    P1 --> G3[Gold Service]
    P1 --> G4[Gold Charging]

    G1 --> C[Consumers]
    G2 --> C
    G3 --> C
    G4 --> C
```

## Operational controls

Monitor:

```text
files received
rows received
bad-record count
schema version
partition completeness
average file size
duplicate event rate
freshness
```

## Recovery

Keep enough source/canonical data to rebuild derived datasets after a bad deployment or corrupt
output.
