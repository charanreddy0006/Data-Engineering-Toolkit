# CI/CD Reference Architecture

```mermaid
flowchart LR
    D[Developer] --> G[Git]
    G --> C[CI Runner]
    C --> T[Tests + Quality]
    T --> B[Build Artifact]
    B --> R[Artifact Registry]
    R --> S[Staging]
    S --> Q[Smoke + Data Quality]
    Q --> P[Production Policy]
    P --> PR[Production]
    PR --> O[Observability]
    O --> RB[Rollback / Recovery]
    RB --> R
```

## Boundary

CI produces a trusted artifact.

CD consumes and promotes that artifact.

This makes release traceability easier.
