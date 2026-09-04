# Installation Verification

After installing Kubernetes locally, verify each layer.

## Client

```bash
kubectl version --client
kubectl config current-context
```

## Cluster

```bash
kubectl cluster-info
kubectl get nodes
```

## Resources

```bash
kubectl get namespaces
kubectl get pods -A
```

## Test workload

```bash
kubectl create deployment web --image=nginx:1.27
kubectl rollout status deployment/web
kubectl get pods -o wide
kubectl delete deployment web
```

## If it fails

Check:

```bash
kubectl config get-contexts
kubectl config current-context
kubectl cluster-info
```

Common reasons:

- cluster is stopped,
- wrong context,
- credentials are unavailable,
- local Kubernetes is disabled,
- API server is unreachable.
