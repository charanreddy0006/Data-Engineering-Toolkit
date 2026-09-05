# What Is CI/CD?

CI/CD is a collection of practices and automation for integrating, validating, packaging, releasing and deploying software.

## Continuous Integration

Developers integrate changes frequently and automated checks validate them.

```text
push
 ↓
checkout
 ↓
lint
 ↓
test
 ↓
build
```

## Continuous Delivery

Changes remain in a releasable state. Deployment can be automated through staging while production may have an approval gate.

## Continuous Deployment

Validated changes automatically reach production.

```text
push → test → build → deploy production
```

## Why it matters

Manual releases create:

- inconsistent steps,
- slow feedback,
- human mistakes,
- poor traceability,
- difficult rollback.

## Data engineering

CI can validate Python, SQL, schemas, Docker and data contracts. CD can deploy a tested ETL image to Kubernetes.

## Key principle

Automation improves repeatability; it does not replace good tests or good engineering.
