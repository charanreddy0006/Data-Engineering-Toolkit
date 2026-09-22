# 20. Containerization

Containers package an ML service and its runtime dependencies consistently.

## Image

```text
Python Runtime
 + Libraries
 + Pipeline Code
 + Configuration
```

## Benefits

- consistent environments
- repeatable deployment
- isolation
- easier CI/CD

## Common Mistakes

- secrets baked into images
- unpinned dependencies
- oversized images
- mutable-only image tags

## Automobile

Package the predictive-maintenance API in Docker and deploy the same image across staging and production.
