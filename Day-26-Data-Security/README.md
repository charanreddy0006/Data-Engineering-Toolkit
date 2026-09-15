# Day 26 — Data Security 🔐🚗

A complete data-engineering-focused guide to protecting data, identities, pipelines, platforms, and data products throughout the lifecycle.

## Learning goals
- Understand CIA, threat modeling, defense in depth, and security principles.
- Design authentication, authorization, IAM, RBAC, ABAC, MFA, and least privilege.
- Understand encryption, TLS, hashing, HMAC, signatures, keys, and KMS.
- Apply masking, tokenization, pseudonymization, DLP, and minimization.
- Secure networks, databases, object storage, lakehouses, APIs, Kafka, Spark, and Airflow.
- Protect secrets, logs, backups, CI/CD, containers, and cloud workloads.
- Design incident response and recovery.
- Apply security to connected vehicles, telemetry, VIN, location, warranty, and EV data.
- Prepare for security interviews and system-design questions.

## Mental model
```text
Identity → Authorization → Network → Application → Data
   |            |             |          |          |
  MFA        RBAC/ABAC      TLS       validation  encryption
   +-------------------------+---------------------------+
                             |
                    Audit / Monitoring
                             |
                    Incident / Recovery
```

## Secure data lifecycle
```text
Collect → Classify → Authenticate → Authorize → Encrypt → Store → Process
   → Share Minimally → Audit → Monitor → Retain → Delete/Recover
```

## Automobile example
```text
Vehicle/ECU → Secure Gateway → Kafka → Encrypted Lakehouse → Governed Data Product
                    TLS          ACL       IAM/KMS          Fine-grained access
                                      \____ Audit + Monitoring ____/
```

Security is not one tool. It is layered controls applied to identities, data, infrastructure, software, and operations.
