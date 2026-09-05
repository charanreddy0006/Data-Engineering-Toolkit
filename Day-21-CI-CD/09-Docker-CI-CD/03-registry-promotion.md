# Registry and Promotion

The registry is the handoff point between CI and CD.

```text
CI
 ↓
Registry
 ↓
CD
```

## Immutable artifact

```text
company/vehicle-etl:git-a81c92
```

The same image can be promoted:

```text
dev → staging → production
```

## Rollback

If release B fails:

```text
B
 ↓
rollback
 ↓
A
```

The registry must retain approved artifacts long enough to support recovery.
