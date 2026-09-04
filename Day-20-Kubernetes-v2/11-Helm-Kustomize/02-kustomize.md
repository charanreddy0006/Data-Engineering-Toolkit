# Kustomize

Kustomize uses a base and overlays approach.

```text
k8s/
├── base/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── kustomization.yaml
└── overlays/
    ├── dev/
    ├── staging/
    └── production/
```

## Base

Common application configuration.

## Overlay

Environment-specific modifications.

Typical changes:

- image tag,
- replicas,
- namespace,
- configuration,
- patches.

Commands:

```bash
kubectl kustomize overlays/dev
kubectl apply -k overlays/dev
```

## Helm vs Kustomize

| Helm | Kustomize |
|---|---|
| Charts and templates | Bases and overlays |
| Values | Patches/transformations |
| Packaging ecosystem | Native kubectl workflow |
| Strong for reusable packages | Strong for environment customization |

Neither is universally better. Follow the team's platform conventions.
