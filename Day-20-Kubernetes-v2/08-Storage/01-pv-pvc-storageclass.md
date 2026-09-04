# Kubernetes Storage

## Why storage is different

Pods are ephemeral. Do not assume the container writable layer is durable application storage.

## PersistentVolume

A PV represents storage available to the cluster.

## PersistentVolumeClaim

A PVC requests storage.

```text
Application
   ↓
PVC
   ↓
PV
   ↓
Storage implementation
```

Example:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: telemetry-data
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
```

## StorageClass

StorageClass describes a storage class and can support dynamic provisioning.

```text
PVC
 ↓
StorageClass
 ↓
Provisioner
 ↓
Storage
```

## Data engineering

For large analytical data, object storage/data-lake systems are often more appropriate than using a Kubernetes PVC as the primary data lake.

## Production questions

- What is the backup policy?
- What happens when a node fails?
- What access mode is needed?
- What are latency/IOPS characteristics?
- Is a managed database better?
- Is object storage better?
