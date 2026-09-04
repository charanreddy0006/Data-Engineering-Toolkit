# Workload Security

## Non-root

```yaml
securityContext:
  runAsNonRoot: true
  allowPrivilegeEscalation: false
```

## Drop capabilities

```yaml
securityContext:
  capabilities:
    drop:
      - ALL
```

Use only what the application actually needs.

## ServiceAccount

Applications interacting with the Kubernetes API can use a dedicated ServiceAccount.

Where Kubernetes API access is unnecessary, consider disabling automatic token mounting:

```yaml
automountServiceAccountToken: false
```

## Security layers

```text
Image security
     ↓
RBAC
     ↓
ServiceAccount
     ↓
Security context
     ↓
NetworkPolicy
     ↓
Secret management
     ↓
Audit / monitoring
```

## Automobile context

Connected vehicle platforms may handle sensitive operational and customer-related information. Kubernetes security should be integrated with the organization's broader identity, encryption, privacy and automotive cybersecurity controls.
