# CI/CD vs GitOps

Traditional CD:

```text
CI/CD runner
 ↓
kubectl / Helm
 ↓
cluster
```

GitOps:

```text
Git desired state
 ↓
GitOps controller
 ↓
Kubernetes
```

GitOps emphasizes declarative state, Git history and reconciliation.

CI/CD remains the broader delivery model.

GitOps can manage Kubernetes application configuration but does not replace the data pipeline itself.
