# kubectl Cheat Sheet

## Cluster

```bash
kubectl version --client
kubectl cluster-info
kubectl get nodes
kubectl get namespaces
```

## Apply/delete

```bash
kubectl apply -f file.yaml
kubectl delete -f file.yaml
```

## Pods

```bash
kubectl get pods
kubectl get pods -o wide
kubectl describe pod NAME
kubectl logs NAME
kubectl logs NAME --previous
kubectl exec -it NAME -- sh
```

## Deployments

```bash
kubectl get deployment
kubectl rollout status deployment/NAME
kubectl rollout history deployment/NAME
kubectl rollout undo deployment/NAME
```

## Services

```bash
kubectl get svc
kubectl describe svc NAME
kubectl get endpointslices
```

## Jobs

```bash
kubectl get jobs
kubectl logs job/NAME
```

## Context

```bash
kubectl config get-contexts
kubectl config current-context
kubectl config use-context NAME
```
