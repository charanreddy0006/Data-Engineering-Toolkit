# Worker Nodes

Worker nodes provide capacity for application workloads.

## Typical components

```text
Worker Node
├── kubelet
├── container runtime
├── networking components
└── Pods
```

## kubelet

The kubelet is the node agent.

It communicates with the control plane and works with the container runtime to manage Pods assigned to the node.

## Container runtime

Modern Kubernetes commonly uses runtimes such as:

- containerd
- CRI-O

Kubernetes interacts through the Container Runtime Interface.

## Pod networking

The exact implementation depends on the cluster networking solution.

Applications should normally communicate through Kubernetes networking abstractions rather than hard-coded Pod IP addresses.

## Data engineering

A cluster can have nodes optimized for different workloads:

```text
General nodes → APIs / ETL
Memory nodes  → memory-heavy processing
GPU nodes     → ML workloads
```

Scheduling rules can guide workloads to appropriate nodes.
