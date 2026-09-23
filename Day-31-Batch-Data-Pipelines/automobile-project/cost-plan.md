# Cost Plan

## Cost Drivers
- compute
- storage
- network
- orchestration
- backfills

## Optimization

- incremental processing
- partition pruning
- Parquet or other efficient formats
- compression
- bounded backfills
- right-sized compute

## Automobile Example

When one week's service logic changes, reprocess the affected partitions instead of rebuilding multiple years of service data.
