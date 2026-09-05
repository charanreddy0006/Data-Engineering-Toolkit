# Secret and Permission Failures

Symptoms:

```text
401
403
permission denied
registry push denied
cluster access denied
```

Check:

- repository permissions,
- registry role,
- cloud identity,
- Kubernetes RBAC,
- environment protection.

Never:

- print credentials,
- give cluster-admin unnecessarily,
- disable security globally.

A test job may need repository read only, while a deployment job may need registry read and controlled Kubernetes permissions.
