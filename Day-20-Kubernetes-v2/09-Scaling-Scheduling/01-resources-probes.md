# Resources and Health Probes

## Requests and limits

```yaml
resources:
  requests:
    cpu: "250m"
    memory: "256Mi"
  limits:
    cpu: "1"
    memory: "512Mi"
```

Requests affect scheduling decisions.

Limits constrain resource usage according to Kubernetes/runtime semantics.

## Readiness

Answers:

> Can this Pod receive traffic?

```yaml
readinessProbe:
  httpGet:
    path: /ready
    port: 8080
```

## Liveness

Answers:

> Should this container be restarted because it appears unhealthy?

```yaml
livenessProbe:
  httpGet:
    path: /health
    port: 8080
```

## Startup

Useful for slow-starting applications.

```yaml
startupProbe:
  httpGet:
    path: /health
    port: 8080
  failureThreshold: 30
  periodSeconds: 5
```

## Key distinction

```text
Running ≠ Ready
```

A service can be alive but not ready because it is still loading configuration or waiting for initialization.
