# GitHub Actions Secrets and Environments

Production pipelines often require credentials.

Never place passwords or cloud keys directly in workflow files.

Use repository/environment secret mechanisms and prefer short-lived identity such as OIDC where supported.

## Environment model

```text
CI
 ↓
staging
 ↓
production
```

Production environments can enforce protection rules.

## Principle

A test job should not automatically receive production credentials.

Give each job only the permissions it needs.
