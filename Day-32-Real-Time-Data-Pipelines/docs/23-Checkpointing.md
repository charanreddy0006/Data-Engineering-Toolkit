# 23. Checkpointing

Checkpoints preserve processing progress and state.

Possible contents:
- source positions
- operator state
- window state
- event-time progress

## Recovery
```text
Failure
 ↓
Restart
 ↓
Restore checkpoint
 ↓
Replay required input
 ↓
Resume
```

## Automobile
A vehicle-health aggregation process can resume after worker failure without rebuilding the entire stream from the beginning.
