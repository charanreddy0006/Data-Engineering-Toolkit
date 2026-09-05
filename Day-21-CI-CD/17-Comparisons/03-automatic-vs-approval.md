# Automatic Deployment vs Approval

## Automatic

```text
merge → CI → production
```

## Approval

```text
merge → CI → staging → approval → production
```

Automatic deployment provides speed and consistency.

Approval can provide additional control for high-risk changes.

For data platforms, destructive schema migrations may need stronger controls than low-risk code changes.
