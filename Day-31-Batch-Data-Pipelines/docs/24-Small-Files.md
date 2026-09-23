# 24. Small-File Problem

Distributed batch processing can create thousands of tiny files.

## Problems

- metadata overhead
- many open operations
- inefficient reads
- slower planning

## Causes

- excessive partitioning
- too many writers
- frequent micro-batches

## Solutions

- compaction
- balanced partitions
- controlled output parallelism

## Automobile

Do not write one tiny object for each vehicle if a daily aggregate can be stored efficiently in larger files.
