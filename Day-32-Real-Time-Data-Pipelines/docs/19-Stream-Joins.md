# 19. Stream Joins

Streaming systems often enrich or combine data.

## Stream + Reference
```text
Telemetry Event + Vehicle Master
                ↓
         Enriched Telemetry
```

## Stream + Stream
Both sides change continuously and typically require time-bounded matching.

## Challenges
- state growth
- time bounds
- late events
- skew
- retention

## Automobile
Join fault events with current/valid vehicle metadata while maintaining correct time semantics.
