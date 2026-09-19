# Feature Store Monitoring Plan

## Freshness

Monitor:
- latest feature timestamp
- expected vs actual update time
- freshness SLA breaches

## Quality

Monitor:
- null percentage
- invalid values
- duplicate entity/timestamp records
- unexpected cardinality

## Distribution

Monitor:
- mean
- quantiles
- missing rate
- distribution shifts

## Online Serving

Monitor:
- p50 latency
- p95 latency
- p99 latency
- error rate
- cache hit rate where applicable

## Incident Example

### Symptom
`battery_soc_latest` is stale for 35 minutes.

### Response
1. Check vehicle event ingestion.
2. Check stream processing.
3. Check online-store writes.
4. Check feature materialization.
5. Verify API lookup path.
6. Restore service.
7. Validate freshness.
8. Document incident.

## Owner

Connected Vehicle ML Platform.
