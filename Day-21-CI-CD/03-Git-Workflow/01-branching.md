# Git Branching for CI/CD

Typical workflow:

```text
main
 ↑
Pull Request
 ↑
feature branch
```

Create:

```bash
git checkout -b feature/telemetry-quality
```

Commit:

```bash
git add .
git commit -m "Add telemetry quality validation"
git push -u origin feature/telemetry-quality
```

CI runs on the Pull Request.

## Protected main

Teams can require:

- successful CI,
- code review,
- no unresolved reviews,
- security checks.

## Data engineering checks

A PR can validate:

- Python,
- SQL,
- schemas,
- data contracts,
- Dockerfiles,
- Kubernetes manifests.

Small changes are easier to review and roll back.
