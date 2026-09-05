# Gates and Approvals

A gate stops progression until a condition is satisfied.

Examples:

- tests pass,
- image scan passes,
- schema compatibility passes,
- data-quality threshold passes,
- owner approves.

## Automated gate

```text
quality
 ↓
pass → continue
fail → stop
```

## Manual gate

```text
staging
 ↓
approval
 ↓
production
```

Approvals should correspond to real risk. A meaningless click is process overhead rather than a useful control.
