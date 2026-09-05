# Kubernetes CD Example

Validate:

```bash
kubectl apply --dry-run=client -f deployment.yaml
```

Deploy the exact approved image:

```bash
kubectl apply -f deployment.yaml
kubectl rollout status deployment/vehicle-etl-api -n vehicle-data
```

Do not use the placeholder image in production.
