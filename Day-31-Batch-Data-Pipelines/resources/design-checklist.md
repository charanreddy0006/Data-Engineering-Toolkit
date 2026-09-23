# Batch Pipeline Design Checklist

1. What is the source?
2. What is the batch window?
3. Full or incremental?
4. What is the watermark?
5. How are deletes handled?
6. What is the partition key?
7. Is the load idempotent?
8. How is late data handled?
9. What is the backfill strategy?
10. What failures are retryable?
11. How are source and target reconciled?
12. What is the SLA?
13. How is freshness monitored?
14. What access is required?
15. What is the expected cost?
