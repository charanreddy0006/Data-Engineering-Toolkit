# Production Data Modeling Architecture

A mature automotive platform can separate ingestion, canonicalization, business modeling, and serving.

```mermaid
flowchart LR
    A[Vehicle Gateway] --> B[Ingestion]
    C[Dealer Systems] --> B
    D[Warranty Systems] --> B
    E[Manufacturing] --> B

    B --> F[Raw / Bronze]
    F --> G[Canonical / Silver]
    G --> H[Business Models]
    H --> I[Warehouse Marts]
    I --> J[BI]
    I --> K[ML / APIs]

    G --> L[Quality]
    H --> M[Governance]
```

## Layer responsibilities

### Raw

Preserve source fidelity and ingestion metadata.

### Canonical

Standardize IDs, units, timestamps, and schema versions.

### Business

Apply enterprise definitions.

### Marts

Optimize for consumers.

## Every published model should have

- grain;
- owner;
- lineage;
- quality tests;
- freshness expectation;
- change policy;
- recovery procedure.
