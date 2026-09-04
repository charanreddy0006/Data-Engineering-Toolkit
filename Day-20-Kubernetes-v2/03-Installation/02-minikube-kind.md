# Minikube and kind

## Minikube

Minikube creates a local Kubernetes environment.

Typical commands:

```bash
minikube start
kubectl get nodes
minikube status
minikube stop
minikube delete
```

## kind

kind means Kubernetes IN Docker.

Typical commands:

```bash
kind create cluster --name learning
kubectl get nodes
kind delete cluster --name learning
```

kind is useful for:

- local development,
- CI tests,
- multi-node simulations,
- manifest testing.

## Choosing

```text
Want a simple local learning cluster → Minikube
Want Kubernetes nodes represented as containers → kind
```

Always use the current official installation instructions because package commands change across operating systems and releases.
