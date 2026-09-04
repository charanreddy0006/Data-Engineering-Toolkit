# Services

Pod IP addresses can change. A Service provides a stable endpoint for matching Pods.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: telemetry-api
spec:
  selector:
    app: telemetry-api
  ports:
    - port: 80
      targetPort: 8080
  type: ClusterIP
```

## Traffic

```text
Client
  ↓
Service
  ↓
selector
  ↓
Pod A / Pod B / Pod C
```

## Types

### ClusterIP

Default internal service.

### NodePort

Exposes a port through cluster nodes.

### LoadBalancer

Requests an external load balancer where the environment supports it.

## Important distinction

Deployment creates/manages Pods.

Service provides stable networking to matching Pods.

## Debug

```bash
kubectl get svc
kubectl describe svc telemetry-api
kubectl get endpointslices
```
