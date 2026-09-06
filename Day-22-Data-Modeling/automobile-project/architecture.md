# Automobile Production Architecture

```mermaid
flowchart LR
    A[Connected Vehicles] --> B[Streaming / Batch Ingestion]
    C[Dealer] --> B
    D[Warranty] --> B
    E[Manufacturing] --> B
    B --> F[Raw]
    F --> G[Canonical]
    G --> H[Dimensions]
    G --> I[Trip Fact]
    G --> J[Telemetry Fact]
    G --> K[Service Fact]
    G --> L[Warranty Fact]
    G --> M[Charging Fact]
    H --> N[Gold Marts]
    I --> N
    J --> N
    K --> N
    L --> N
    M --> N
    N --> O[BI / ML / APIs]
```

## Key decisions

- event time and ingestion time are both preserved;
- telemetry is immutable;
- vehicle is a conformed dimension;
- ownership/history is temporal;
- trips, service, and charging remain separate business processes;
- daily state is a snapshot;
- gold marts are consumer-oriented.
