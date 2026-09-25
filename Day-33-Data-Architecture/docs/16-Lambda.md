# 16. Lambda Architecture

Lambda combines batch and speed-processing paths.

```text
                    ┌→ Batch → Batch Views ─┐
Sources → Data ──────┤                       ├→ Serving
                    └→ Speed → Speed Views ─┘
```

## Goal
Provide low-latency results while retaining a batch path for complete recomputation.

## Benefits
- historical recomputation
- real-time views

## Challenges
The same business logic may be implemented twice and can produce consistency differences.

## Automobile
Use streaming for current vehicle faults and batch processing for authoritative daily fleet metrics.
