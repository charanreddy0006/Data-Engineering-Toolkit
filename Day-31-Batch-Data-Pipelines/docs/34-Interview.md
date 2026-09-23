# 34. Interview Questions

## Beginner

1. What is batch processing?
2. Batch vs streaming?
3. Full load vs incremental load?
4. What is a watermark?
5. What is partitioning?
6. What is idempotency?
7. What is a backfill?

## Intermediate

1. How do you make a batch job rerunnable?
2. How do you handle late-arriving records?
3. Why use checkpoints?
4. How do you reconcile source and target?
5. How do you choose a partition key?
6. How do you handle duplicates?
7. What causes the small-file problem?

## Advanced

1. Design a batch pipeline for billions of vehicle events.
2. Recover from a partial failure.
3. Backfill one month without disrupting production.
4. Handle source schema evolution.
5. Reduce cloud processing cost.

## Scenario

A morning dashboard is missing 20% of service records.

Investigate:
source availability → watermark → staging → filters → partitions → target write → reconciliation → downstream refresh.
