# Automobile CI/CD Architecture

```mermaid
flowchart LR
    V[Vehicles] --> G[Gateway]
    G --> API[Telemetry API]
    API --> K[Kafka]
    K --> F[Flink / Spark]
    F --> L[Raw Lake]
    F --> A[Aggregations]
    A --> W[Warehouse]
    L --> Q[Quality]
    Q --> W
    W --> BI[BI / API]
```

CI/CD surrounds this platform:

```text
Git → CI → Registry → Kubernetes → Observability
```

Kubernetes manages workloads; Kafka, Flink/Spark and storage retain specialized responsibilities.
