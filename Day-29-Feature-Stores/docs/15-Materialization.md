# 15. Materialization

## Meaning

Materialization is the process of making computed feature values available in a serving location, especially an online store.

## Concept

```text
Offline Historical Features
          ↓
     Materialization
          ↓
     Online Store
```

## Why It Exists

Historical computation may be performed in a warehouse, while online prediction requires low-latency access.

## Materialization Questions

- What time range is copied?
- How often?
- Which features?
- How are deletes handled?
- What happens to stale values?
- How are failed runs retried?

## Automobile Example

Every 15 minutes materialize selected vehicle-health features for vehicles that are actively connected.

## Performance

Do not materialize every possible feature just because it exists. Select features according to actual serving requirements.
