# 21 — Docker Interview Questions

## Beginner

1. What is Docker?
2. What is a container?
3. What is an image?
4. What is a Dockerfile?
5. What is Docker Compose?
6. What is a volume?
7. What is a network?
8. What does `--rm` do?
9. What does `-p` do?
10. Why use `.dockerignore`?

## Intermediate

11. Explain image layers.
12. Explain Docker networking.
13. Why does localhost differ inside containers?
14. Bind mount vs named volume?
15. CMD vs ENTRYPOINT?
16. COPY vs ADD?
17. Why use multi-stage builds?
18. Why are health checks useful?
19. How do you persist PostgreSQL?
20. How would you containerize a Python ETL?

## Advanced

21. How would you reduce image size?
22. How would you secure a container?
23. How would you design Docker CI/CD?
24. Docker vs VM?
25. Docker vs Kubernetes?
26. How would you debug a restart loop?
27. How would you handle secrets?
28. How would you version images?
29. How would you package a data platform?
30. When would you use Compose vs Kubernetes?

## Scenario — Connection Failure

Check:

```text
hostname
port
credentials
network
health
database
```

## Scenario — Data Disappeared

Check:

```text
volume
mount path
volume deletion
database initialization
```

## Scenario — Huge Image

Inspect:

```text
base image
OS packages
dependencies
build artifacts
raw data
```

## Scenario — Rollback

Use:

```text
versioned image
 ↓
known-good version
 ↓
rollback
```

## Scenario — ETL Restart

Design:

```text
unique event ID
+
staging
+
deduplication
+
upsert/merge
```

so a retry does not silently duplicate business data.
