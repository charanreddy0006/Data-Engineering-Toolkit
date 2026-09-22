# 23. Reproducibility

A pipeline is reproducible when its result can be recreated from known inputs.

## Record

```text
Data Version
Feature Version
Code Commit
Parameters
Environment
Model Version
```

## Example

```text
dataset=v12
features=v4
code=abc123
seed=42
model=v7
```

## Best Practices

- version code
- version datasets
- pin dependencies
- record configuration
- preserve artifacts
- avoid hidden manual steps

## Why?

Reproducibility turns debugging from guesswork into evidence-based investigation.
