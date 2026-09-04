# Kubernetes History and Evolution

## High-level evolution

```text
Processes
   ↓
Virtual machines
   ↓
Containers
   ↓
Container orchestration
   ↓
Kubernetes ecosystem
```

Kubernetes was created at Google and publicly introduced in 2014. Its design was influenced by Google's experience with large-scale internal cluster-management systems.

The project later became a major CNCF project.

## Why the history matters

The project was designed for distributed systems rather than for running one isolated process.

Its architecture emphasizes:

- declarative APIs,
- controllers,
- scheduling,
- reconciliation,
- extensibility.

## Modern Kubernetes

Today Kubernetes can be:

- self-managed,
- offered as a managed cloud service,
- used locally for learning,
- embedded into internal platforms.

Examples of managed services include EKS, GKE and AKS.

## Learning lesson

Do not memorize history instead of understanding architecture.

The important evolution is:

```text
Run application
      ↓
Package application
      ↓
Run many packaged applications
      ↓
Coordinate failures, networking and scaling
```
