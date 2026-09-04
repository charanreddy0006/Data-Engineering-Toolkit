# StatefulSet and DaemonSet

## StatefulSet

StatefulSet is designed for workloads requiring stable identity and/or storage semantics.

Examples:

- some distributed databases,
- stateful processing systems,
- selected messaging systems.

Concept:

```text
StatefulSet
 ├── pod-0 → storage-0
 ├── pod-1 → storage-1
 └── pod-2 → storage-2
```

Do not automatically run every database as a StatefulSet. Managed databases can reduce operational burden.

## DaemonSet

DaemonSet places a Pod on every eligible node or selected nodes.

Typical uses:

- log agents,
- monitoring agents,
- security agents,
- node-level networking components.

```text
Node 1 → agent
Node 2 → agent
Node 3 → agent
```

When a new eligible node joins, the DaemonSet can create its Pod.

## Data engineering

A telemetry cluster might use:

```text
DaemonSet → node-level observability
Deployment → API
Job → quality
CronJob → aggregation
```
