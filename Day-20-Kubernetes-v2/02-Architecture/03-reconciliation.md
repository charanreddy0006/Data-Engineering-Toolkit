# Desired State and Reconciliation

Reconciliation is one of Kubernetes' most important ideas.

## Desired state

A manifest might say:

```yaml
replicas: 3
```

## Observed state

Suppose only two Pods are available.

```text
desired = 3
actual  = 2
```

A controller detects the difference and takes action.

```text
Desired
   ↓
Controller
   ↓
Cluster
   ↓
Observe
   ↓
Difference?
   ↓
Reconcile
```

## Why this matters

Distributed systems experience:

- crashes,
- node failures,
- network problems,
- manual changes,
- deployment changes.

A reconciliation model allows many routine failures to be corrected automatically.

## Warning

Kubernetes can continuously enforce a bad configuration.

Always validate:

- image,
- resources,
- probes,
- security,
- storage,
- networking,
- application behavior.
