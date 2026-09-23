# 14. Retries

Retries are useful for transient failures.

Examples:
- network timeout
- temporary service outage
- temporary database connection issue
- API rate limit

## Backoff

```text
Attempt 1 → fail
   ↓
wait
   ↓
Attempt 2 → fail
   ↓
longer wait
   ↓
Attempt 3
```

Do not retry permanent failures such as invalid schema or authorization errors.

## Automobile example

Retry a temporary service-database outage but stop on an incompatible source schema.
