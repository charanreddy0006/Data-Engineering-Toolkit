# Automotive Data Security Capstone 🚗🔐

## Scenario
A connected-vehicle manufacturer receives telemetry and combines it with vehicle master, customer, location, service, warranty, and EV data.

## Architecture
```text
Vehicles → Secure Gateway → Kafka → Encrypted Bronze → Silver → Certified Products
     |           |            |          |               |
 device        TLS          ACLs       IAM/KMS      Fine-grained access
                                      + Audit/Monitoring/Secrets
```

## Deliverables
- threat model
- security architecture
- access matrix
- encryption strategy
- secrets policy
- telemetry security policy
- incident runbook
- security KPI SQL

## Portfolio story
`Business requirement → threat → security control → implementation → evidence → continuous monitoring`
