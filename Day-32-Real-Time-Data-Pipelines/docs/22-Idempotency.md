# 22. Streaming Idempotency

A sink is easier to retry when repeated application of an event does not change the intended result.

## Example
```text
UPSERT by event_id
```

instead of blindly inserting every retry.

## Automobile
A fault event with `event_id=E123` must not increment a downstream count twice because a consumer restarted.

## Techniques
- unique keys
- upsert
- deterministic writes
- transactional boundaries
- deduplication state
