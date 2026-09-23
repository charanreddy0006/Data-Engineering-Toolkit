# 20. Parallelism

Parallelism allows independent work to execute at the same time.

```text
                 ┌→ Region A
Source → Batch ──┼→ Region B
                 └→ Region C
```

## Benefits
- shorter runtime
- better resource utilization

## Risks
- source overload
- database contention
- memory pressure
- API rate limits

## Automobile example

Process dealer partitions in parallel while limiting total concurrency so the source database remains healthy.
