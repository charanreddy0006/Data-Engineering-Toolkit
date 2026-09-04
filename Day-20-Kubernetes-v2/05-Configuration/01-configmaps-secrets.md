# ConfigMaps and Secrets

## ConfigMap

Stores non-sensitive configuration.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: telemetry-config
data:
  LOG_LEVEL: INFO
  BATCH_SIZE: "500"
```

Reference:

```yaml
envFrom:
  - configMapRef:
      name: telemetry-config
```

## Secret

Intended for sensitive values.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: database-credentials
type: Opaque
stringData:
  DB_USER: telemetry
  DB_PASSWORD: replace-me
```

Reference:

```yaml
envFrom:
  - secretRef:
      name: database-credentials
```

## Security warning

Do not commit real passwords, API tokens or private keys.

Kubernetes Secrets also require appropriate production controls such as encryption at rest, strict RBAC and often integration with external secret-management systems.

## Configuration principle

```text
Same application image
       ├── dev configuration
       ├── staging configuration
       └── production configuration
```

Do not rebuild an application merely because the database host changes.
