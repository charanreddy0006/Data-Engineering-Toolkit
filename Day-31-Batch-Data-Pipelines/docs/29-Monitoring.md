# 29. Batch Monitoring

## Operational metrics

- success rate
- duration
- retries
- records read
- records written
- bytes processed

## Data metrics

- freshness
- null percentage
- duplicate count
- reconciliation result
- schema changes

## Example

```text
Pipeline: daily_service_load
Status: SUCCESS
Rows: 4,820,312
Duration: 18m
Freshness: 05:12
Quality: PASSED
```

## Alerts

Alert on actionable conditions:
- missed SLA
- repeated failures
- freshness breach
- reconciliation mismatch
- unexpected volume
