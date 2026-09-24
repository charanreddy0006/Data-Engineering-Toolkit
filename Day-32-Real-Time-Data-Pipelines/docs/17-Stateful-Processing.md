# 17. Stateful Processing

State remembers information across events.

Examples:
- latest battery SOC
- fault count per vehicle
- last fault timestamp
- running trip distance

```text
Event 1 → State
Event 2 → Updated State
Event 3 → Updated State
```

## Risks
- unbounded state
- memory pressure
- recovery complexity
- hot keys

Use expiry/TTL where business semantics allow it.
