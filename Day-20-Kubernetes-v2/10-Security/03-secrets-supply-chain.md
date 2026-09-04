# Secret and Image Supply-Chain Security

## Build pipeline

```text
Source
 ↓
Build
 ↓
Unit tests
 ↓
Dependency scan
 ↓
Image scan
 ↓
Registry
 ↓
Deployment
```

## Practices

- do not bake credentials into images,
- scan dependencies,
- scan container images,
- use trusted base images,
- update vulnerable dependencies,
- use intentional image tags/digests,
- restrict registry access,
- use provenance/signing where required.

## Runtime

Combine:

```text
RBAC
ServiceAccounts
securityContext
NetworkPolicy
secret management
audit
```

## Important

Security is not one Kubernetes YAML field.

It is a system spanning:

```text
source → build → registry → cluster → workload → data
```
