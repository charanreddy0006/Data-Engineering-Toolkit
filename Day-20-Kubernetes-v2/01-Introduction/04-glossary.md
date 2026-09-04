# Kubernetes Glossary

| Term | Meaning |
|---|---|
| Cluster | Kubernetes environment containing control-plane and worker resources |
| Node | Machine providing compute capacity |
| Pod | Smallest deployable Kubernetes unit |
| Container | Application process inside a Pod |
| Deployment | Controller for replicated stateless workloads |
| ReplicaSet | Maintains a desired number of Pods |
| Service | Stable network abstraction for Pods |
| Namespace | Logical grouping/isolation boundary |
| ConfigMap | Non-sensitive configuration object |
| Secret | Object intended for sensitive values |
| Job | Run-to-completion workload |
| CronJob | Creates Jobs on a schedule |
| StatefulSet | Controller for stateful workloads |
| DaemonSet | Places Pods on eligible nodes |
| Ingress | HTTP/HTTPS routing API |
| Gateway API | Kubernetes networking API family |
| PV | PersistentVolume |
| PVC | PersistentVolumeClaim |
| StorageClass | Storage provisioning abstraction |
| RBAC | Role-Based Access Control |
| ServiceAccount | Workload identity for Kubernetes API access |
| Label | Selectable key/value metadata |
| Selector | Mechanism for choosing matching objects |
| Probe | Application health/readiness check |
| HPA | Horizontal Pod Autoscaler |
| etcd | Cluster-state key-value store |
| kubelet | Node agent |
| Scheduler | Chooses nodes for Pods |
| Controller | Reconciles desired and observed state |
