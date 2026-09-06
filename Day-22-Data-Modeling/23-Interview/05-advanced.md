# Advanced Interview Topics

## How would you model late-arriving facts?

Preserve event time and ingestion time, use a controlled lookback/backfill strategy, and make
incremental models replayable.

## How would you handle changing identifiers?

Maintain a durable mapping between source identifiers and canonical business identity rather than
hard-coding joins throughout downstream models.

## How would you handle a breaking schema change?

Version the contract, support migration, communicate consumers, validate both versions during the
transition, and remove the old contract only after dependencies are migrated.

## How do you model a many-to-many measure?

Use a bridge and an explicit allocation rule. Never assume direct joins preserve additive measures.

## How do you validate a new dimensional model?

Check grain, uniqueness, referential relationships, historical intervals, measure reconciliation,
freshness, and representative business queries.
