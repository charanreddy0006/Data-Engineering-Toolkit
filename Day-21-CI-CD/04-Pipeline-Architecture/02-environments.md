# CI/CD Environments

Typical progression:

```text
development
    ↓
staging
    ↓
production
```

## Principle

Use the same application artifact while environment configuration changes.

```text
same image
 ├── dev config
 ├── staging config
 └── prod config
```

## Promotion

```text
build
 ↓
test
 ↓
staging
 ↓
verify
 ↓
production
```

This reduces environment-specific build differences.

## Data engineering

Staging should use representative schemas and test datasets where possible, without exposing inappropriate production data.
