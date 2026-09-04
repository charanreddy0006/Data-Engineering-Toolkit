# Why Kubernetes Exists

Containers make applications easier to package, but running hundreds or thousands of containers creates operational problems.

## Problems

- Where should a workload run?
- What happens when a machine fails?
- How do we maintain three replicas?
- How do we update applications without unnecessary downtime?
- How do services discover each other?
- How do we manage configuration?
- How do we control CPU and memory?
- How do we recover failed workloads?

## Before orchestration

```text
Server 1 → container A
Server 2 → container B
Server 3 → container C
```

Operators had to coordinate many actions manually.

## Kubernetes approach

```text
Desired state
     ↓
API
     ↓
Scheduler + controllers
     ↓
Workers
```

If a Pod disappears and the workload says three replicas are required, the controller works toward restoring three.

## Important tradeoff

Kubernetes reduces some operational toil but introduces platform complexity.

You now need to understand:

- YAML,
- APIs,
- networking,
- storage,
- scheduling,
- security,
- observability.

Use it when those capabilities justify the complexity.
