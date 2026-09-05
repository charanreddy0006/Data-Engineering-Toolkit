# Advanced CI/CD Scenarios

## Production differs from staging
Check artifact identity first, then environment configuration, dependencies, permissions and resources.

## Image passed staging but fails production
Verify it is the exact same image. Then inspect secrets, network, resources and external dependencies.

## ETL duplicates after retry
Inspect retry layers, concurrency and idempotency. Fix the data operation, not only the deployment.

## Schema change breaks consumers
Use compatibility tests, data contracts and expand/contract migration.

## Production secret appears in logs
Rotate/revoke it, investigate exposure, fix the pipeline and audit access. Do not simply delete the visible line.
