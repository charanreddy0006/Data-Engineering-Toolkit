# Kubernetes YAML Quick Reference

## Object

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app
  namespace: default
```

## Selector

```yaml
selector:
  matchLabels:
    app: app
```

## Container

```yaml
containers:
  - name: app
    image: repo/app:1.0
    ports:
      - containerPort: 8080
```

## Resources

```yaml
resources:
  requests:
    cpu: 100m
    memory: 128Mi
  limits:
    cpu: 500m
    memory: 512Mi
```

## Probe

```yaml
readinessProbe:
  httpGet:
    path: /ready
    port: 8080
```

## ConfigMap

```yaml
envFrom:
  - configMapRef:
      name: config
```

## Secret

```yaml
envFrom:
  - secretRef:
      name: secret
```
