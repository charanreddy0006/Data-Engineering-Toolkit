# Pods

A Pod is the smallest deployable Kubernetes unit.

A Pod can contain one or more closely coupled containers.

## Basic Pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: hello
spec:
  containers:
    - name: nginx
      image: nginx:1.27
      ports:
        - containerPort: 80
```

Apply:

```bash
kubectl apply -f pod.yaml
```

Inspect:

```bash
kubectl get pod hello
kubectl describe pod hello
kubectl logs hello
```

## Pod lifecycle

Conceptually:

```text
Pending → Running → Succeeded
                 ↘ Failed
```

## Why not use bare Pods for applications?

A bare Pod is a low-level object.

For long-running stateless applications, use a Deployment so Kubernetes can manage replicas and updates.

## Multi-container Pod

```text
Pod
├── main application
└── tightly coupled helper/sidecar
```

Containers in a Pod share networking and can communicate using localhost where appropriate.

Do not put unrelated applications into one Pod.
