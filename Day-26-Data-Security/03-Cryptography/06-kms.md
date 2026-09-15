# KMS Pattern

## Purpose
A managed key-management service can centralize protected keys and access controls.

## Pattern

```text
Application → KMS/Key Vault → Encryption Operation
                         ↓
                       Audit
```

## Reminder

Exact KMS capabilities vary by platform; architecture should not assume one provider.
