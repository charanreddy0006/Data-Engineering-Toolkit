# Day 21 — CI/CD for Data Engineering 🚀

A complete, practical CI/CD module covering software delivery and data-engineering pipelines.

## Learning goals

- CI, Continuous Delivery and Continuous Deployment.
- Git branching, Pull Requests, reviews and releases.
- Pipeline, workflow, stage, job, step, runner, artifact and cache.
- GitHub Actions and GitLab CI.
- Python, SQL, schema and data-quality testing.
- Docker image build, scanning, registry and promotion.
- Kubernetes deployment, rollout and rollback.
- Secrets, OIDC, least privilege and supply-chain security.
- Blue-green, rolling, canary and progressive delivery.
- Database migration safety.
- CI/CD for Python ETL, dbt, Airflow, Spark and Flink.
- Connected-vehicle/automobile CI/CD architecture.
- Troubleshooting, comparisons, interview questions and cheat sheets.

## Big picture

```text
Developer
   ↓
Git / Pull Request
   ↓
CI
 ├── lint
 ├── unit tests
 ├── SQL/schema tests
 ├── data-quality tests
 ├── security checks
 └── build artifact
   ↓
Artifact Registry
   ↓
Staging
   ↓
integration + smoke + data-quality checks
   ↓
approval / policy
   ↓
Production
   ↓
monitoring
   ↓
rollback / recovery
```

## CI vs CD

**Continuous Integration** frequently integrates changes and automatically validates them.

**Continuous Delivery** keeps changes in a releasable state and automates delivery, while production may still require approval.

**Continuous Deployment** automatically deploys validated changes to production.

## Data engineering perspective

CI should validate more than Python:

```text
Python
SQL
schemas
transformations
data contracts
Dockerfiles
Kubernetes manifests
data-quality rules
```

CD should promote the **same tested artifact** rather than rebuilding different artifacts for each environment.

## Automobile example

```text
Vehicle telemetry code
        ↓
Pull Request
        ↓
CI
 ├── Python tests
 ├── SQL tests
 ├── schema compatibility
 ├── Docker build
 └── security scan
        ↓
Container Registry
        ↓
Staging Kubernetes
        ↓
Telemetry smoke/data-quality tests
        ↓
Production
```

## Repository map

```text
Day-21-CI-CD/
├── README.md
├── ROADMAP.md
├── GIT-COMMIT.md
├── 01-Foundations/
├── 02-CI-CD-Concepts/
├── 03-Git-Workflow/
├── 04-Pipeline-Architecture/
├── 05-GitHub-Actions/
├── 06-GitLab-CI/
├── 07-Testing/
├── 08-Artifacts-Versioning/
├── 09-Docker-CI-CD/
├── 10-Kubernetes-CD/
├── 11-Security/
├── 12-Deployment-Strategies/
├── 13-Data-Engineering/
├── 14-Automobile/
├── 15-Projects/
├── 16-Troubleshooting/
├── 17-Comparisons/
├── 18-Interview/
├── 19-Cheat-Sheets/
├── 20-Resources/
├── examples/
└── automobile-project/
```

## Learning rule

For every pipeline, understand:

```text
Trigger
 ↓
Validate
 ↓
Build
 ↓
Artifact
 ↓
Promote
 ↓
Deploy
 ↓
Verify
 ↓
Monitor
 ↓
Rollback / recover
```
