# Data Security Reference Architecture

## Purpose
Combine identity, network, application, data, monitoring, and recovery controls.

## Architecture

```text
Users/Services → Identity/MFA → IAM/RBAC/ABAC
                         ↓
                Network + Application
                         ↓
                 Encryption + KMS
                         ↓
                  Data Platforms
                         ↓
                Audit + Monitoring
                         ↓
                 Incident + Recovery
```

## Principle

No single layer should be the only protection.
