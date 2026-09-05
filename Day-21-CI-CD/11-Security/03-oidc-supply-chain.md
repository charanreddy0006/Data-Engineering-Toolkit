# OIDC and Supply-Chain Security

Long-lived cloud keys are risky because they can be copied and are difficult to rotate.

OIDC can provide short-lived identity:

```text
CI identity
 ↓
OIDC token
 ↓
cloud identity provider
 ↓
short-lived credentials
 ↓
resource
```

## Traceability

```text
commit
 ↓
build
 ↓
artifact
 ↓
scan/provenance
 ↓
deployment
```

This is especially valuable for production data platforms and regulated environments.
