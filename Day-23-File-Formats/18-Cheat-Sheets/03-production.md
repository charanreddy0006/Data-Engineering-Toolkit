# Production File Checklist

## Input
- source known
- encoding known
- schema known
- expected volume known

## Ingest
- validate
- type cast
- detect duplicates
- quarantine failures
- capture lineage

## Store
- appropriate format
- compression
- sensible partitions
- reasonable file sizes

## Publish
- row count
- schema
- quality
- freshness
- completeness

## Operate
- monitor file count
- monitor small files
- monitor schema drift
- retain recovery data
- document owners
