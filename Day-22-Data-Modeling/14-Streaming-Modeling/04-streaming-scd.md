# Streaming Facts + Changing Dimensions

Suppose:

```text
08:00 trip event
08:30 dealer changes
09:00 event arrives
```

If enrichment uses only the current dimension, the 08:00 trip can receive the wrong dealer.

## Temporal enrichment

Match the dimension version valid at event time:

```text
event_time >= valid_from
AND event_time < valid_to
```

## Options

- stream-table join with temporal state;
- event-carried attributes;
- periodic dimension snapshots;
- downstream reconciliation.

## Design question

Does the business require exact historical enrichment or is current-state enrichment acceptable?

That answer determines the complexity of the architecture.
