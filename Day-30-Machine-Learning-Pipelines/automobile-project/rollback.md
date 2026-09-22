# Rollback

## Trigger
Unexpected production behavior, service failure or prediction regression.

## Procedure

```text
Detect
 ↓
Stop promotion
 ↓
Restore previous validated model
 ↓
Smoke test
 ↓
Resume
 ↓
Investigate
```

## Preserve
- previous artifact
- feature version
- code commit
- deployment configuration
- incident details
