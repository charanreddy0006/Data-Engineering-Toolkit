# 28. Rollback and Recovery

A production ML pipeline needs a controlled recovery path.

## Example

```text
Model v12 Production
 ↓
Problem Detected
 ↓
Stop Promotion
 ↓
Restore v11
 ↓
Validate
 ↓
Investigate v12
```

## Keep

- previous model artifact
- deployment configuration
- feature version
- code version
- run metadata

## Automobile

If a new model creates an unexplained alert spike, return to the last validated model while investigating.
