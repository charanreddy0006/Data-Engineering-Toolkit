# Beginner Project — Python API

## Goal

Deploy a Python HTTP application to Kubernetes.

```text
Docker image
    ↓
Deployment
    ↓
Pods
    ↓
Service
```

## Build

```bash
docker build -t k8s-python-api:1.0 .
```

For kind:

```bash
kind load docker-image k8s-python-api:1.0
```

For Minikube, use its supported image-loading workflow.

## Deploy

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

## Inspect

```bash
kubectl get pods
kubectl get svc
kubectl logs deployment/python-api
```

## Learning objectives

- Deployment
- replicas
- labels/selectors
- Service
- logs
- local image usage
