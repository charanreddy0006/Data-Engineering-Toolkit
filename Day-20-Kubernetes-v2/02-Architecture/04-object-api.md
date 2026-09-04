# Kubernetes Objects and API

Most Kubernetes resources have metadata and a specification.

Conceptually:

```yaml
metadata:
  name: telemetry-api

spec:
  replicas: 3

status:
  availableReplicas: 3
```

## spec

The `spec` represents desired configuration.

## status

The `status` represents observed information maintained by Kubernetes/controllers.

## API-first workflow

```text
YAML
 ↓
kubectl
 ↓
API Server
 ↓
resource
 ↓
controller/scheduler
 ↓
workload
```

## Practical command

```bash
kubectl get deployment telemetry-api -o yaml
```

This is useful for diagnosis, but live-cluster YAML often contains generated fields. Do not blindly copy it into source control.

## Key idea

Kubernetes is an API platform first; kubectl is a client of that API.
