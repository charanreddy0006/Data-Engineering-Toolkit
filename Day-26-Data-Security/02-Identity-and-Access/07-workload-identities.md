# Workload Identities

## Purpose
Machine-to-machine access should use dedicated identities rather than shared human credentials.

## Pattern

```text
Pipeline → Workload Identity → IAM Policy → Data Resource
```

## Avoid

Hard-coded passwords, committed API keys, and production credentials inside images or notebooks.
