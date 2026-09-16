# Automotive Dashboard Specification

## Overview
- telemetry health
- freshness
- Kafka lag
- active incidents
- SLO status

## Streaming
- events/sec
- producer errors
- consumer errors
- processing latency

## Data Quality
- invalid %
- duplicate %
- missing vehicle IDs
- schema failures
- EV range violations

## Drill-down

```text
Overview → Service → Pipeline → Dataset → Run/Event Window
```
