# Deployment Failure

For Kubernetes:

```bash
kubectl rollout status deployment/vehicle-api
kubectl get pods
kubectl describe pod <pod>
kubectl logs <pod>
```

## Common causes

- image pull failure,
- bad configuration,
- application crash,
- readiness failure,
- insufficient resources.

## Rollback

```bash
kubectl rollout undo deployment/vehicle-api
```

Then verify the data system separately. Application rollback does not undo data writes.
