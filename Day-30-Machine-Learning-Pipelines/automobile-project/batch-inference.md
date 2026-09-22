# Batch Inference

## Example Schedule
Every day at 02:00.

## Steps
1. Select active vehicles.
2. Read current features.
3. Check freshness.
4. Load approved model.
5. Generate scores.
6. Write prediction partition.
7. Validate output count.
8. Publish to downstream systems.

## Idempotency
Rerunning the same prediction date should safely replace or upsert that date's output rather than create duplicates.
