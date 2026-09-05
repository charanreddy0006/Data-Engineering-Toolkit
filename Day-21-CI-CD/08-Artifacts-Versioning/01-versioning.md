# Artifact Versioning

A release should have an identifiable version.

## Semantic versioning

Common pattern:

```text
MAJOR.MINOR.PATCH
```

For example:

```text
2.3.1
```

The exact versioning convention is a team decision.

## Commit-based identity

A container can also be tagged:

```text
company/etl:git-a81c92
```

## Best practice

Use immutable identifiers for deployment.

Avoid relying on:

```text
latest
```

as the only production reference.

## Traceability

```text
production
 ↓
image
 ↓
commit
 ↓
Pull Request
```
