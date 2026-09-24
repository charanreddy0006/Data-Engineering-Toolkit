# 20. Deduplication

Distributed systems may deliver the same event more than once.

## Pattern
```text
Event ID
  ↓
Seen?
 ├→ yes → ignore
 └→ no  → process + remember
```

## Key
Use a stable `event_id` where possible.

## State cost
Dedup state needs retention; keeping every historical event ID forever may be unnecessary.

## Automobile
Gateway retry can resend the same fault event. Deduplication prevents inflated fault counts.
