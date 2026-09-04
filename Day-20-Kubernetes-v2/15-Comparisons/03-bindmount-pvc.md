# Bind Mount vs PVC

| Feature | Docker bind mount | Kubernetes PVC |
|---|---|---|
| Typical scope | Local Docker host | Kubernetes storage abstraction |
| Portability | Host-path dependent | Cluster/storage integration |
| Dynamic provisioning | No | Can be supported |
| Production cluster use | Limited | Common for stateful workloads |
| Data-engineering lake | Not appropriate | Usually not the primary choice |

## Mental model

Docker:

```text
Host directory
     ↓
Container
```

Kubernetes:

```text
Pod
 ↓
PVC
 ↓
PV / storage provisioner
```

For large analytics datasets, evaluate object storage first.
