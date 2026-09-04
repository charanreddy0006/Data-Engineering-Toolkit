# Kubernetes Examples

Run examples in order.

```text
01 Pod
 ↓
02 Deployment + Service
 ↓
03 ConfigMap
 ↓
04 Job
 ↓
05 CronJob
 ↓
06 PVC
 ↓
07 Probes
 ↓
08 RBAC
```

Useful commands:

```bash
kubectl apply -f .
kubectl get pods
kubectl describe pod NAME
kubectl logs NAME
kubectl delete -f .
```

For each example, change one thing and observe the effect. That is more valuable than simply applying every manifest.
