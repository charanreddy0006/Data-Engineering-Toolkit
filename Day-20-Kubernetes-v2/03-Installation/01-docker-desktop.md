# Local Kubernetes with Docker Desktop

Docker Desktop can provide a local Kubernetes environment suitable for learning.

## Verify Docker first

```powershell
docker version
docker run --rm hello-world
```

Enable Kubernetes using the current Docker Desktop settings.

## Verify Kubernetes

```powershell
kubectl version --client
kubectl cluster-info
kubectl get nodes
kubectl get pods -A
```

## Test

```powershell
kubectl create deployment nginx --image=nginx:1.27
kubectl get deployment
kubectl get pods
kubectl delete deployment nginx
```

## Learning note

A local cluster is excellent for:

- manifests,
- Pods,
- Services,
- Deployments,
- Jobs,
- storage,
- networking practice.

It does not reproduce every operational property of a production cluster.
