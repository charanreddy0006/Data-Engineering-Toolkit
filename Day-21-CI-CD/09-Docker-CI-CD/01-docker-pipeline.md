# Docker CI/CD

Typical flow:

```text
Git
 ↓
tests
 ↓
docker build
 ↓
scan
 ↓
registry
 ↓
deploy
```

Build:

```bash
docker build -t company/vehicle-etl:1.0 .
```

## Good practices

- intentional version tags,
- immutable release references,
- minimal image,
- non-root runtime,
- `.dockerignore`,
- dependency scanning,
- current base images.

## Promotion

```text
registry
 ↓
staging
 ↓
production
```

The image should not be rebuilt during promotion.
