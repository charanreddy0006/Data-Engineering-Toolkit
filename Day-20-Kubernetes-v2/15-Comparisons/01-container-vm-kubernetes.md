# Containers vs VMs vs Kubernetes

| Concern | Container | VM | Kubernetes |
|---|---|---|---|
| Package application | Yes | Yes | No |
| Process isolation | Yes | Strong machine abstraction | Uses underlying mechanisms |
| Run application | Yes | Yes | Yes |
| Cluster scheduling | No | External | Yes |
| Replica management | No | External | Yes |
| Service discovery | Limited | External | Yes |
| Rolling updates | No | External | Yes |
| Cluster reconciliation | No | No | Yes |

## Relationship

```text
Compute
  ↓
VM / physical node
  ↓
Container runtime
  ↓
Containers
  ↓
Kubernetes orchestration
```

Kubernetes is an orchestration layer, not a replacement for all lower-level infrastructure.
