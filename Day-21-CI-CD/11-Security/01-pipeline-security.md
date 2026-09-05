# CI/CD Security

CI/CD systems can access powerful resources:

```text
repository
registry
cloud
Kubernetes
production data
```

## Principles

### Least privilege
A unit-test job should not have production deployment permissions.

### Secret isolation
Expose credentials only to jobs that require them.

### Protected branches
Do not allow arbitrary unreviewed code to deploy production.

### Short-lived identity
Prefer OIDC/workload identity where supported.

### Auditability
Record who/what/when/commit/artifact/environment.

## Pull Request threat

```text
untrusted PR
 ↓
CI runner
 ↓
secret access?
```

Do not expose sensitive production credentials to untrusted execution unnecessarily.
