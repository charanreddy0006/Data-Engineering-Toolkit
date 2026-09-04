# Kubernetes Scenario Interview Questions

## Scenario 1: Pod is Pending

Steps:

```bash
kubectl describe pod <pod>
```

Check Events, resource requests, node selectors, taints, affinity and PVCs.

## Scenario 2: CrashLoopBackOff

Check:

```bash
kubectl logs <pod>
kubectl logs <pod> --previous
kubectl describe pod <pod>
```

Look for application errors, command errors, configuration issues and probe failures.

## Scenario 3: Service has no traffic

Check:

```text
Service selector
↓
Pod labels
↓
EndpointSlices
↓
Pod readiness
↓
targetPort
↓
application listening port
```

## Scenario 4: ETL duplicates after retry

Kubernetes is not enough.

Implement:

- unique constraints,
- upserts,
- transactions,
- staging,
- atomic publish,
- idempotency keys.

## Scenario 5: HPA scales but latency stays high

Investigate:

- database saturation,
- downstream limits,
- connection pools,
- storage I/O,
- network,
- queue partitions,
- CPU/memory pressure.

More Pods cannot remove every bottleneck.
