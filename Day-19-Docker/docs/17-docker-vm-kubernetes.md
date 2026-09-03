# 17 — Docker vs VM vs Kubernetes

## Containers

Simplified:

```text
Host Kernel
 |
 +-- Container A
 +-- Container B
 +-- Container C
```

Containers generally share the host kernel.

## Virtual Machines

```text
Host
 |
 +-- Hypervisor
      |
      +-- Guest OS A
      |     +-- Application
      |
      +-- Guest OS B
            +-- Application
```

VMs contain guest operating systems.

## Kubernetes

Kubernetes is a container orchestration platform.

It manages:

- scheduling
- desired state
- service discovery
- scaling
- rolling deployments
- workload recovery

## Comparison

| | Docker/Compose | VM | Kubernetes |
|---|---|---|---|
| Main purpose | Container workflows | OS virtualization | Container orchestration |
| Local development | Excellent | Possible | More complex |
| Multi-node scheduling | Limited | Hypervisor based | Strong |
| Scaling | Simple/manual | VM based | Orchestrated |
| Learning curve | Lower | Medium | Higher |

## Important Relationship

Do not say:

> Kubernetes is simply Docker at scale.

Better:

> Docker provides container tooling and image workflows, while Kubernetes orchestrates containerized workloads.

Modern Kubernetes environments can run OCI-compatible images without requiring Docker Engine as the node runtime.

## Compose

Excellent for:

- local development
- integration tests
- demonstrations
- small environments

## Kubernetes

Useful when you need:

- multiple nodes
- automated scheduling
- rolling updates
- scaling
- self-healing workloads

Do not introduce Kubernetes just because a project has two containers.
