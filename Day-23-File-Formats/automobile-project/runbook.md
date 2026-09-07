# Automobile File-Format Runbook

## Incident 1 — Schema mismatch

1. Identify first failing file.
2. Compare expected and observed schemas.
3. Check producer version.
4. Classify compatible vs breaking.
5. Quarantine if necessary.
6. Update contract only after approval.
7. Reprocess affected data.

## Incident 2 — Too many small files

1. Count files per partition.
2. Calculate average size.
3. Identify writer configuration.
4. Check partition cardinality.
5. Compact safely.
6. Verify row counts and duplicate IDs.
7. Compare query performance.

## Incident 3 — Wrong totals

Check:

```text
duplicate files
duplicate events
wrong partition
late data
fan-out joins
incorrect aggregation
```

## Incident 4 — Corrupt Parquet

1. isolate file;
2. verify metadata/footer;
3. compare against manifest;
4. quarantine;
5. regenerate from trusted input;
6. validate;
7. republish.

## Incident 5 — Unit change

If `speed_kph` suddenly represents mph, stop publication, classify as a semantic breaking change,
correct the producer/contract, and reprocess affected data.
