# Spark and Flink CI/CD

Distributed processing artifacts should be versioned.

```text
source
 ↓
tests
 ↓
build artifact/image
 ↓
registry
 ↓
deploy
```

## Special streaming concern

Flink and other stateful systems can have:

- checkpoints,
- state,
- offsets,
- schema dependencies.

A code rollback may require state compatibility.

## Automobile example

A fault detector may maintain:

```text
vehicle_id → rolling statistics
```

Changing the state model requires deliberate migration planning.
