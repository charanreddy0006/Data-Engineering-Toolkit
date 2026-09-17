# 19. Refresh and Incremental Loading

## Full Refresh
Reloads the complete dataset.

Advantages:
- Simple
- Easy to reason about

Disadvantages:
- Expensive
- Slow for large data

## Incremental Refresh
Processes only new or changed data.

```text
Historical Data ───────────────┐
                               ├→ BI Dataset
Recent Window → Refresh Often ─┘
```

## Automobile Example
A trip fact contains five years of history. Refresh only the latest 30 days because late-arriving corrections are expected there.

## Important Questions
- What is the incremental key?
- How are updates detected?
- How are deletes handled?
- How much historical data can change?
- What happens after a failed refresh?
- How is the last successful refresh monitored?

## Reliability
Always expose refresh status and timestamp to users.
