# 17. Dependency Management

Tasks should execute only when required upstream conditions are satisfied.

```text
Vehicle Master
      ↓
Service Transform
      ↓
Service Mart
      ↓
Dashboard
```

## Dependencies can be

- task-based
- dataset-based
- time-based
- pipeline-based

## Automobile

Do not publish dealer analytics before required vehicle master updates are available.

Explicit dependencies are easier to operate than hidden assumptions.
