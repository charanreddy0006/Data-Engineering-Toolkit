# 31. Security Architecture

Security should be designed across the entire data path.

```text
Identity
 ↓
Authentication
 ↓
Authorization
 ↓
Network Controls
 ↓
Encryption
 ↓
Data Access
 ↓
Audit
```

## Principles
- least privilege
- defense in depth
- environment separation
- managed secrets
- key management
- auditable access

## Automobile
Separate access to telemetry, customer-linked records, dealer data and BI aggregates.

## Trust Boundaries
Document where data crosses networks, accounts, teams or organizations.
