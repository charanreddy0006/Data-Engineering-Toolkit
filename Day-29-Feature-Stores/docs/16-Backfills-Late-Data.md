# 16. Backfills and Late-Arriving Data

## Backfill

A backfill recomputes historical feature values for a past period.

Reasons:
- corrected source data
- bug fixes
- revised business logic
- new historical data
- model retraining

## Late Data

An event can arrive after its event timestamp.

Example:
```text
event_time: 09:55
arrival_time: 10:07
```

The pipeline must decide whether and how historical windows are updated.

## Safe Backfill

```text
Change
 ↓
Test small period
 ↓
Validate
 ↓
Run larger period
 ↓
Reconcile
 ↓
Publish
```

## Automobile Example

A batch of vehicle telemetry arrives late after a network outage. Recalculate affected daily features rather than blindly appending duplicate aggregates.

## Important

Backfills should be repeatable and idempotent whenever possible.
