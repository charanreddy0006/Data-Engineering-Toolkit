# CI/CD System Design — Vehicle Telemetry

Requirement: release a telemetry API and ETL safely.

```text
PR
 ↓
Python + SQL + schema tests
 ↓
Docker build
 ↓
security scan
 ↓
registry
 ↓
staging Kubernetes
 ↓
smoke + data-quality gate
 ↓
production
 ↓
monitor
```

Use an immutable artifact.

For failure:

```text
code rollback
+
data recovery plan
```

must be separate.

Security should include:

- least privilege,
- protected branches,
- OIDC,
- secret management,
- image scanning,
- audit trail.

The strongest system-design answer explains failure and recovery, not just deployment.
