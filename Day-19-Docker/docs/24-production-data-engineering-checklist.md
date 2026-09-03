# 24 — Production Data Engineering Docker Checklist

## Application

```text
[ ] Clear entry point
[ ] Configuration externalized
[ ] Logs to stdout/stderr
[ ] Bounded retries
[ ] Permanent failures handled
```

## Image

```text
[ ] Trusted base
[ ] Reasonable size
[ ] Dependencies controlled
[ ] No credentials
[ ] No production data
[ ] Non-root
[ ] Security scan
```

## Storage

```text
[ ] State externalized
[ ] Database persistence
[ ] Backup strategy
[ ] Recovery strategy
```

## Networking

```text
[ ] Service names
[ ] No unnecessary published ports
[ ] Internal services protected
[ ] External access authenticated
```

## Data Pipeline

```text
[ ] Idempotency
[ ] Schema validation
[ ] Quality checks
[ ] Batch/event IDs
[ ] Failure handling
[ ] Observability
```

## CI/CD

```text
[ ] Unit tests
[ ] Integration tests
[ ] Docker build
[ ] Image scan
[ ] Versioned image
[ ] Registry
[ ] Deployment
[ ] Rollback
```

## Automobile

For connected vehicles additionally consider:

```text
[ ] Device authentication
[ ] Event integrity
[ ] Telemetry protection
[ ] Data retention
[ ] Auditability
[ ] High-volume ingestion
[ ] Late events
[ ] Out-of-order events
```

## Final Principle

A good Docker image cannot compensate for poor data architecture.

```text
Containerization
+
Data correctness
+
Security
+
Observability
+
Reliability
=
Production-ready platform
```
