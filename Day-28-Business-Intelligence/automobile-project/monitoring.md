# BI Monitoring

## Data Health
- Freshness
- Row count
- Null rate
- Duplicate rate
- Schema changes

## Pipeline Health
- Job duration
- Failure rate
- Retry count
- Late arrivals

## BI Health
- Dataset refresh status
- Query latency
- Capacity usage
- Dashboard adoption

## Incident Example
If telemetry is 4 hours old:
1. Check ingestion.
2. Check raw event arrival.
3. Check transformations.
4. Check aggregate tables.
5. Check semantic refresh.
6. Display stale-data warning.
7. Resolve and document incident.
