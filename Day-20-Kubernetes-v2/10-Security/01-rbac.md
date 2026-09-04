# RBAC

Role-Based Access Control defines permissions for Kubernetes API operations.

## Model

```text
Subject
  ↓
Role / ClusterRole
  ↓
RoleBinding / ClusterRoleBinding
  ↓
Permissions
```

## Role

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: telemetry-reader
  namespace: data
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["get", "list", "watch"]
```

## Binding

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: telemetry-reader-binding
  namespace: data
subjects:
  - kind: ServiceAccount
    name: telemetry-reader
    namespace: data
roleRef:
  kind: Role
  name: telemetry-reader
  apiGroup: rbac.authorization.k8s.io
```

## Principle

Give workloads only the permissions they require.

Avoid `cluster-admin` for applications simply because it makes development easier.
