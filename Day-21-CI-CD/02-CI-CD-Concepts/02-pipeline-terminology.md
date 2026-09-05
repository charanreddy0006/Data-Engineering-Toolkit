# CI/CD Pipeline Terminology

**Workflow:** configured automation.

**Pipeline:** sequence of automated activities.

**Stage:** logical phase such as test/build/deploy.

**Job:** unit of executable work.

**Step:** individual operation within a job.

**Runner:** machine/environment executing a job.

**Artifact:** release output such as a package, image or report.

**Cache:** optimization used to speed repeated work.

**Environment:** deployment target such as dev, staging or production.

**Gate:** condition that must pass before progression.

## Critical distinction

```text
Artifact = source of release truth
Cache    = speed optimization
```

Never make a production release depend on an unreliable cache.
