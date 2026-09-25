# 2. Architecture Principles

## Core Principles

### Separation of concerns
Keep ingestion, transformation and serving responsibilities distinct.

### Loose coupling
Producers should not need to know every consumer.

### Design for failure
Assume network, job, storage and service failures.

### Security by design
Access control and encryption belong in the architecture.

### Observability
Make system health explainable.

### Cost awareness
Every architecture decision has an operational cost.

### Simplicity
Do not introduce distributed complexity without a requirement.

## Rule
Start with business requirements, then choose architecture, then choose tools.
