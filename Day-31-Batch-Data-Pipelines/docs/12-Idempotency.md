# 12. Idempotency

A batch operation is idempotent when a safe retry does not create unintended duplicates or corruption.

## Bad

```text
Retry → INSERT all rows again
```

## Better

```text
Retry → MERGE by business key
```

## Techniques

- MERGE
- unique keys
- partition overwrite
- staging + publish
- transactional boundaries

## Automobile example

Rerunning a daily service partition should replace the partition or upsert by service-order key, not duplicate orders.
