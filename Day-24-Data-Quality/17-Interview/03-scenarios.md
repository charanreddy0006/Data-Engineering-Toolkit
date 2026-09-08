# Scenario-Based Interview Questions

## 30% null vehicle IDs

Check source changes, mapping, schema version, producer scope, affected partitions, and downstream impact. Contain and quarantine if necessary.

## Duplicate telemetry after replay

Identify the business key and replay behavior. Use deterministic deduplication rather than blindly deleting rows.

## Pipeline green but dashboard wrong

Inspect counts, joins, filters, aggregates, source changes, freshness, reconciliation, and semantic changes.

## All values valid but distribution changed

Investigate source behavior, firmware, units, population mix, and legitimate business events.

## Data arrives late

Separate late-but-valid data from corruption using event time, ingestion time, watermarking, and explicit lateness policy.

## Schema changed without notice

Contain, identify affected consumers through lineage, restore compatibility, and introduce a contract/compatibility gate.
