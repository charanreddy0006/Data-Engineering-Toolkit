# ImagePullBackOff and ErrImagePull

If a Pod cannot start because its image cannot be pulled:

```bash
kubectl describe pod <pod>
```

Look at Events.

## Common causes

- image name is wrong,
- tag does not exist,
- registry authentication is missing,
- registry is unreachable,
- image architecture is incompatible,
- local cluster cannot see locally built image.

## Local image issue

You may build:

```bash
docker build -t vehicle-api:1.0 .
```

but the Kubernetes node may not have access to that local Docker image.

For kind:

```bash
kind load docker-image vehicle-api:1.0
```

For Minikube, use its image-loading workflow.

## Production

Use a registry:

```text
CI
 ↓
registry
 ↓
Kubernetes nodes
```

Avoid relying on developer laptop images for production.
