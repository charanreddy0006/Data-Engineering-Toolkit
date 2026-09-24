# Recovery

```text
Failure → Restart → Restore Checkpoint → Replay → Validate → Resume
```

After recovery validate lag, output freshness, event counts and duplicate rate.

Replay depends on event retention and sink semantics.
