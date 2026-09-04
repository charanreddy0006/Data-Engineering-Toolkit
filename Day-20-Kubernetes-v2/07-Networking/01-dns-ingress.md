# DNS, Service Discovery and Ingress

## Service DNS

If a Service is called:

```text
postgres
```

a workload in the same namespace can commonly use:

```text
postgres:5432
```

Across namespaces:

```text
postgres.data:5432
```

A fully qualified service DNS name commonly follows:

```text
service.namespace.svc.cluster-domain
```

## Do not use Pod IPs

Bad:

```text
DB_HOST=10.42.1.15
```

Better:

```text
DB_HOST=postgres.data
```

## Ingress

Ingress provides an API for HTTP/HTTPS routing.

```text
Internet
   ↓
Ingress Controller
   ↓
Service
   ↓
Pods
```

The Ingress resource alone does not implement routing; an Ingress controller is needed.

## Gateway API

Gateway API provides a more expressive networking API family for traffic management and can support clearer separation of platform and application responsibilities.

## Debugging

```bash
kubectl get svc
kubectl get endpointslices
kubectl describe svc telemetry-api
```
