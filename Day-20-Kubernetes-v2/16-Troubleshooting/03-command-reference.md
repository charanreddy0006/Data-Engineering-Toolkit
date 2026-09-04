# Kubernetes Debug Command Reference

## Cluster

```bash
kubectl cluster-info
kubectl get nodes
kubectl get events --sort-by=.lastTimestamp
```

## Pods

```bash
kubectl get pods -o wide
kubectl describe pod NAME
kubectl logs NAME
kubectl logs NAME --previous
kubectl logs -f NAME
kubectl exec -it NAME -- sh
```

## Workloads

```bash
kubectl get deployment
kubectl get rs
kubectl get jobs
kubectl get cronjobs
```

## Networking

```bash
kubectl get svc
kubectl get endpointslices
kubectl describe svc NAME
```

## Rollouts

```bash
kubectl rollout status deployment/NAME
kubectl rollout history deployment/NAME
kubectl rollout undo deployment/NAME
```

## Configuration

```bash
kubectl get configmaps
kubectl get secrets
```

Never print sensitive Secret values into CI logs or shared terminals.
