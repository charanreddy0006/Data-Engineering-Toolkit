# Failure and Recovery

## Failure Types

- Source unavailable
- Pipeline failure
- Online store unavailable
- Schema change
- Stale feature
- Invalid feature values

## Recovery Priorities

### Online Inference
Prefer service continuity with clearly defined fallback behavior.

### Training
Prefer reproducibility and correctness over using incomplete data.

## Recovery Flow

```text
Detect
 ↓
Classify
 ↓
Contain
 ↓
Recover
 ↓
Validate
 ↓
Communicate
 ↓
Prevent Recurrence
```

## Example

If online features are stale, do not silently treat stale data as current. Expose freshness status and follow the model's defined fallback policy.
