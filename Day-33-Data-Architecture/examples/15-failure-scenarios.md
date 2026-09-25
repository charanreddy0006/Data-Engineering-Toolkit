# Failure Scenarios

## Source Down
Pause or retry ingestion according to SLA.

## Processing Failure
Restore from checkpoint or rerun an idempotent unit.

## Schema Change
Route incompatible data for controlled handling.

## Region Failure
Follow documented DR and validate consistency after recovery.
