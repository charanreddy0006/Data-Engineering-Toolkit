# Namespaces, Labels and Selectors

## Namespace

Namespaces group resources.

Examples:

```text
dev
staging
production
data
monitoring
```

Create:

```bash
kubectl create namespace data
```

## Labels

```yaml
labels:
  app: telemetry-api
  environment: production
  component: ingestion
```

## Selectors

Services and controllers use selectors to identify matching resources.

```yaml
selector:
  matchLabels:
    app: telemetry-api
```

Query:

```bash
kubectl get pods -l app=telemetry-api
```

## Annotations

Annotations are metadata that is generally not used for selection.

## Rule

If you need to select it, use a label.

If it is informational metadata, an annotation may be more appropriate.
