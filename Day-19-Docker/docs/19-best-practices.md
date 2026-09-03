# 19 — Docker Best Practices

## Dockerfile

1. Use trusted base images.
2. Use an appropriate image size.
3. Use `.dockerignore`.
4. Order layers for cache reuse.
5. Control dependency versions.
6. Run as non-root.
7. Avoid secrets.
8. Use exec-form commands.
9. Consider multi-stage builds.
10. Scan images.

## Compose

1. Add health checks.
2. Use named volumes for state.
3. Use service names for networking.
4. Externalize configuration.
5. Expose only necessary ports.
6. Keep services focused.
7. Document destructive commands.

## Data Engineering

1. Make jobs restartable.
2. Make loads idempotent.
3. Keep raw datasets outside images.
4. Log useful batch metadata.
5. Validate input.
6. Test schema migrations.
7. Handle transient failures.
8. Version images.

## Production Checklist

```text
[ ] Reproducible
[ ] Secure
[ ] Observable
[ ] Versioned
[ ] Tested
[ ] Replaceable
[ ] Persistent state handled
```

## Anti-pattern

Avoid a giant container containing:

```text
PostgreSQL
Kafka
Spark
Airflow
Python
raw data
```

unless a specific architecture requires it.

## Principle

Containers should have clear responsibilities and manageable lifecycles.
