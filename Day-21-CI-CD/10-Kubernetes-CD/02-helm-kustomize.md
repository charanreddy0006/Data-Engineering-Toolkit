# Helm and Kustomize in CD

## Helm

```bash
helm upgrade --install telemetry ./chart   --namespace vehicle-data   --create-namespace
```

Useful for reusable packaged applications.

## Kustomize

```bash
kubectl apply -k overlays/staging
```

Useful for environment overlays.

## Production rule

Render and inspect configuration before deployment.

```text
render
 ↓
validate
 ↓
diff/review
 ↓
deploy
```

Do not store real production secrets in ordinary source-controlled manifests.
