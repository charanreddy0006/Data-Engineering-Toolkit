# Kubernetes Control Plane

The control plane coordinates cluster state.

## API Server

The API server is the main API endpoint.

```text
kubectl
  ↓
API Server
  ↓
authentication
authorization
admission/validation
  ↓
Kubernetes resources
```

## etcd

etcd stores Kubernetes cluster state.

Because cluster state depends on etcd, production clusters need appropriate availability, backup and recovery procedures.

## Scheduler

The scheduler selects suitable nodes for Pods.

It considers constraints such as:

- resource requests,
- node selectors,
- affinity,
- taints and tolerations,
- topology constraints.

## Controller manager

Controllers reconcile resources.

Examples include controllers associated with:

- Deployments,
- ReplicaSets,
- Jobs,
- Nodes.

## Simple mental model

```text
API Server  → accepts and serves API requests
etcd       → stores cluster state
Scheduler  → selects nodes
Controllers → reconcile state
```
