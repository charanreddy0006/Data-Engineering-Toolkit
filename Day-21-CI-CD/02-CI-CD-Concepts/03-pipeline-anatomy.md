# Pipeline Anatomy

```text
Trigger
 ↓
Checkout
 ↓
Dependencies
 ↓
Lint
 ↓
Unit tests
 ↓
Integration tests
 ↓
Security
 ↓
Build
 ↓
Publish
 ↓
Staging
 ↓
Smoke/Data quality
 ↓
Approval/policy
 ↓
Production
```

## Data engineering pipeline

```text
Python tests
 ↓
SQL tests
 ↓
Schema validation
 ↓
Data-quality checks
 ↓
Docker build
 ↓
Image scan
 ↓
Registry
 ↓
Kubernetes
```

Cheap deterministic checks should generally run early.

## Principle

Do not remove important tests merely to make deployment faster. Optimize the pipeline after measuring where time is actually spent.
