# Helm

Helm provides packaging and templating capabilities for Kubernetes applications.

Typical chart:

```text
chart/
├── Chart.yaml
├── values.yaml
└── templates/
    ├── deployment.yaml
    ├── service.yaml
    └── configmap.yaml
```

Example values:

```yaml
replicaCount: 3

image:
  repository: vehicle-api
  tag: "1.4.0"
```

Useful commands:

```bash
helm lint ./chart
helm template telemetry ./chart
helm install telemetry ./chart
helm list
helm upgrade telemetry ./chart
helm rollback telemetry 1
helm uninstall telemetry
```

## Important habit

Inspect rendered YAML:

```bash
helm template telemetry ./chart
```

Do not make templates so abstract that operators cannot understand the final Kubernetes resources.

## Good use

Helm is useful for reusable application packages with configurable deployment values.
