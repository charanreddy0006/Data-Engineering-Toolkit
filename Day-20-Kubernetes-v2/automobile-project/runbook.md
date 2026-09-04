# Automobile Platform Runbook

## Deploy

```bash
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/quality-job.yaml
```

## Inspect

```bash
kubectl get pods -n automobile-data
kubectl get jobs -n automobile-data
kubectl get cronjobs -n automobile-data
```

## Logs

```bash
kubectl logs -n automobile-data job/automobile-quality
```

## If the Job fails

```bash
kubectl describe job -n automobile-data automobile-quality
kubectl get pods -n automobile-data
kubectl logs -n automobile-data <pod>
```

## If the application is Pending

Check:

```bash
kubectl describe pod -n automobile-data <pod>
```

Inspect Events and resource constraints.

## Data incident

If duplicate events appear:

1. identify event IDs,
2. check retry history,
3. inspect sink constraints,
4. determine whether processing is idempotent,
5. repair the affected partition,
6. document root cause.

## Production warning

This project is a learning architecture. A production fleet platform needs stronger identity, encryption, privacy, observability, disaster recovery and automotive cybersecurity controls.
