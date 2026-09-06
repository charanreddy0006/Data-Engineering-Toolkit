# End-to-End Automobile Model Architecture

```mermaid
flowchart TD
    A[Connected Vehicles] --> B[Ingestion]
    C[Dealer Systems] --> B
    D[Warranty] --> B
    E[Manufacturing] --> B
    B --> F[Bronze / Raw]
    F --> G[Silver / Canonical]
    G --> H[Vehicle Dimension]
    G --> I[Trip Fact]
    G --> J[Telemetry Fact]
    G --> K[Service Fact]
    G --> L[Charging Fact]
    H --> M[Gold Marts]
    I --> M
    J --> M
    K --> M
    L --> M
    M --> N[BI / ML / APIs]
```

## Design principles

- preserve raw data for replay;
- canonicalize units and identifiers;
- separate business-process grains;
- use conformed dimensions;
- test historical intervals;
- publish consumer-specific marts.
