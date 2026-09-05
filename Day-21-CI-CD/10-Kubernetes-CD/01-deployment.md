# Kubernetes Continuous Deployment

Flow:

```text
Git
 ↓
CI
 ↓
image
 ↓
registry
 ↓
CD
 ↓
Deployment
 ↓
Pods
 ↓
smoke test
```

Kubernetes CD can use:

- kubectl,
- Helm,
- Kustomize,
- GitOps tooling.

## Responsibility boundary

```text
CI → build/test/package
CD → release/deploy/verify
```

The exact boundary depends on the organization.
