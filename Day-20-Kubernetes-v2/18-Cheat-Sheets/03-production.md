# Kubernetes Production Checklist

## Workloads

- [ ] Image version is intentional
- [ ] No secrets baked into image
- [ ] Requests defined
- [ ] Limits reviewed
- [ ] Readiness configured
- [ ] Liveness/startup behavior understood
- [ ] Graceful shutdown implemented

## Networking

- [ ] Service selectors tested
- [ ] Exposure reviewed
- [ ] DNS dependencies documented
- [ ] NetworkPolicy considered

## Security

- [ ] Non-root where practical
- [ ] RBAC least privilege
- [ ] ServiceAccount reviewed
- [ ] Secret management
- [ ] Image/dependency scanning
- [ ] Audit logging

## Data

- [ ] Idempotency
- [ ] Retry semantics
- [ ] Durable storage
- [ ] Backup/recovery
- [ ] Schema compatibility
- [ ] Data quality

## Operations

- [ ] Logs centralized
- [ ] Metrics available
- [ ] Alerts defined
- [ ] Rollback tested
- [ ] Runbook documented
- [ ] Disaster recovery tested
