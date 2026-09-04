# NetworkPolicy

NetworkPolicy controls network traffic to/from Pods when supported by the cluster network implementation.

## Principle

Start with required communication.

```text
telemetry-api
    ├── allowed → postgres
    └── denied  → unrelated service
```

Example:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: api-to-postgres
spec:
  podSelector:
    matchLabels:
      app: telemetry-api
  policyTypes:
    - Egress
  egress:
    - to:
        - podSelector:
            matchLabels:
              app: postgres
      ports:
        - protocol: TCP
          port: 5432
```

## Important

NetworkPolicy behavior depends on the networking implementation.

## Automobile security

Connected-vehicle platforms should restrict unnecessary communication between:

- ingestion,
- processing,
- databases,
- administrative services.

Kubernetes NetworkPolicy is one layer of a larger cybersecurity architecture.
