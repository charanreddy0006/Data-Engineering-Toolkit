# Scheduling and HPA

## Scheduling

The scheduler selects nodes for unscheduled Pods.

Inputs can include:

- resource requests,
- nodeSelector,
- affinity,
- taints/tolerations,
- topology constraints.

Example:

```yaml
nodeSelector:
  workload: data
```

## HPA

Horizontal Pod Autoscaler changes replica count according to metrics.

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: telemetry-api
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: telemetry-api
  minReplicas: 2
  maxReplicas: 10
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 70
```

## Important

HPA depends on metrics and sensible resource requests.

CPU is not always the best signal.

A streaming ingestion service may be more strongly correlated with:

- request rate,
- queue depth,
- event rate,
- consumer lag.

## Scaling warning

If database connections are already saturated, adding ten more API Pods can make the situation worse.

Always identify the bottleneck first.
