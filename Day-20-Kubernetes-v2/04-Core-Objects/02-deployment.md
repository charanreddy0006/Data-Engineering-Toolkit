# Deployments

A Deployment manages a set of replicated Pods, usually for stateless applications.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: telemetry-api
spec:
  replicas: 3
  selector:
    matchLabels:
      app: telemetry-api
  template:
    metadata:
      labels:
        app: telemetry-api
    spec:
      containers:
        - name: api
          image: company/telemetry-api:1.0.0
          ports:
            - containerPort: 8080
```

## Commands

```bash
kubectl apply -f deployment.yaml
kubectl get deployment
kubectl get rs
kubectl get pods
```

## Update

```bash
kubectl set image deployment/telemetry-api api=company/telemetry-api:1.1.0
kubectl rollout status deployment/telemetry-api
```

## Rollback

```bash
kubectl rollout history deployment/telemetry-api
kubectl rollout undo deployment/telemetry-api
```

## Why Deployment?

It provides:

- replica management,
- rolling updates,
- revision history,
- rollback,
- declarative state.

## Automobile example

A telemetry API can run:

```text
Service
  ↓
Pod Pod Pod
```

If one Pod fails, the Deployment works toward maintaining the desired replica count.
