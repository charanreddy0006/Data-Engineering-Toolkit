# 21. BI Monitoring

## What to Monitor

### Data
- Freshness
- Completeness
- Row counts
- Schema changes
- Data quality

### Platform
- Refresh duration
- Query latency
- Failure rate
- Capacity usage

### Business
- Dashboard views
- Active users
- Dataset adoption
- Failed KPI checks

## Example SLO
```text
95% of scheduled BI refreshes complete before 07:00.
```

## Incident Flow
```text
Detect → Triage → Identify Layer → Restore → Validate → Communicate → Review
```

## Automobile Example
If connected-vehicle ingestion stops, the fleet dashboard should show a freshness warning rather than silently displaying stale telemetry.

## Governance
Every critical dashboard should have an owner, refresh SLA, source, KPI definitions and support procedure.
