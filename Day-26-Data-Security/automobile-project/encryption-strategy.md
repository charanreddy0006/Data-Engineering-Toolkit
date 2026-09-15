# Encryption Strategy
## At rest
Encrypt databases, lakehouse/object-storage data, snapshots, and backups using platform-supported controls.
## In transit
Use TLS for vehicle gateway ingestion, broker clients, application/database communication, and service paths where applicable.
## Keys
```text
Generate → KMS/Key Vault → Authorized Use → Audit → Rotate → Revoke
```
Key administration and data access should not be unrestricted under one identity.
