# Day 20 — Kubernetes 🚢

A complete, practical Kubernetes learning module for a Data Engineering journey.

## Learning goals

- Understand why Kubernetes exists and what problem orchestration solves.
- Understand clusters, control plane, worker nodes and reconciliation.
- Master Pods, Deployments, ReplicaSets, Services and Namespaces.
- Use ConfigMaps, Secrets, Jobs and CronJobs.
- Understand networking, DNS, Ingress/Gateway concepts and NetworkPolicy.
- Understand volumes, PV, PVC and StorageClass.
- Configure requests, limits, probes, scheduling and HPA.
- Apply RBAC and workload security.
- Understand Helm and Kustomize.
- Deploy data-engineering workloads such as Python ETL and quality jobs.
- Design a connected-vehicle telemetry platform using Kubernetes.
- Debug Pending, CrashLoopBackOff, image-pull and Service problems.
- Prepare for Kubernetes interviews and system-design discussions.

## Core mental model

```text
Dockerfile → Image → Registry
                    ↓
             Kubernetes API
                    ↓
        Deployment / Job / CronJob
                    ↓
                   Pod
                    ↓
               Container
```

Kubernetes is an orchestration platform. It does not replace data-processing engines such as Spark or Flink.

## Architecture

```text
                  kubectl / API clients
                           │
                           ▼
                    ┌──────────────┐
                    │ API Server   │
                    └──────┬───────┘
                           │
              ┌────────────┼────────────┐
              ▼            ▼            ▼
            etcd       Scheduler    Controllers
              │            │            │
              └────────────┼────────────┘
                           ▼
                    Desired state
                           │
          ┌────────────────┼────────────────┐
          ▼                ▼                ▼
       Worker 1         Worker 2         Worker 3
       kubelet          kubelet          kubelet
       runtime          runtime          runtime
       Pods             Pods             Pods
```

## Recommended learning order

1. Introduction
2. Architecture
3. Core objects
4. Configuration
5. Workloads
6. Networking
7. Storage
8. Scaling and scheduling
9. Security
10. Helm/Kustomize
11. Data engineering
12. Automobile architecture
13. Projects
14. Troubleshooting
15. Interview preparation

## First commands

```bash
kubectl version --client
kubectl config current-context
kubectl cluster-info
kubectl get nodes
kubectl get pods -A
kubectl get namespaces
```

## Portfolio target

By the end, you should be able to explain not just *what YAML means*, but:

- Why a Deployment is used instead of a bare Pod.
- Why a Service is needed.
- Why a Job is appropriate for ETL.
- Why a CronJob is appropriate for scheduled processing.
- Why persistent analytical data should not live only inside Pods.
- How Kubernetes handles failures.
- How workloads are secured.
- Where Kubernetes ends and Spark/Flink/Kafka/database responsibilities begin.
