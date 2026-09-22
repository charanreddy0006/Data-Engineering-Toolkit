# 22. CI/CD for ML

## Continuous Integration

Check every change with:
- unit tests
- data tests
- pipeline tests
- package/build checks

## Continuous Delivery

```text
Commit
 ↓
Tests
 ↓
Build
 ↓
Validate
 ↓
Deploy
 ↓
Smoke Test
```

## ML-Specific Checks

- feature schema
- model loading
- prediction structure
- metric thresholds
- artifact integrity

## Automobile

A change to the telemetry feature transformation should run automated tests before it can reach production.
