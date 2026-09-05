# CI/CD History and Evolution

A simplified evolution:

```text
Manual release
   ↓
Build scripts
   ↓
Automated CI
   ↓
Continuous Delivery
   ↓
Containers
   ↓
Cloud + Kubernetes
   ↓
Progressive delivery + supply-chain security
```

Earlier teams often released large batches manually.

CI encouraged frequent integration and automated validation.

CD extended automation into packaging and deployment.

Modern platforms add:

- infrastructure as code,
- containers,
- artifact registries,
- Kubernetes,
- security scanning,
- observability,
- policy.

## Data engineering evolution

A SQL/ETL workflow can evolve from:

```text
manual SQL
 ↓
Git
 ↓
tests
 ↓
dbt/ETL package
 ↓
CI
 ↓
artifact
 ↓
automated deployment
```

The objective is controlled and repeatable change.
