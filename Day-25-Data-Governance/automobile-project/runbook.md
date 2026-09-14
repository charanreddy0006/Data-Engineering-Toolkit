# Governance Incident Runbook

## Scenario

A certified telemetry product contains invalid `battery_soc` values.

## Response

1. Detect and record incident.
2. Determine affected time range and partitions.
3. Identify owner and steward.
4. Use lineage to identify downstream consumers.
5. Quarantine or stop publication if risk warrants.
6. Identify root cause.
7. Correct source/transformation.
8. Backfill affected data.
9. Re-run quality controls.
10. Communicate resolution.
11. Record evidence.
12. Review whether policy, contract, or monitoring should change.

## Severity

Severity should reflect business impact, risk, affected consumers, and duration.
Do not define severity solely from row count.
