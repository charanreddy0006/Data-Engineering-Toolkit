# 22. Compression

Compression reduces storage and data-transfer requirements.

Common codecs include:
- gzip
- snappy
- zstd

## Trade-off

More compression may save storage and I/O but consume additional CPU.

## Practical rule

Benchmark using the real workload rather than choosing purely from theoretical compression ratios.

## Batch use

Compressed columnar data can significantly reduce analytical scans.
