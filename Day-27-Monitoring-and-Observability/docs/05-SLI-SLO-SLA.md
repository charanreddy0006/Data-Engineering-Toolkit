# SLI, SLO, SLA and Error Budget

## SLI

Service Level Indicator: a measurement of service behavior.

Examples:
- successful pipeline runs
- API latency
- data freshness
- event processing latency

## SLO

Service Level Objective: a target for an SLI over a defined period.

Example:

`Telemetry freshness must remain within the product's defined target.`

The actual target must be based on consumer needs and system capability.

## SLA

Service Level Agreement: a formal business/contractual commitment that may include
service targets and consequences.

## Error Budget

If an SLO allows a small amount of unreliability, that allowed unreliability forms
an error budget.

```text
Reliability Target
       ↓
Allowed Failure
       ↓
Error Budget
       ↓
Engineering Tradeoffs
```

Define measurement boundaries precisely; ambiguous SLOs create misleading alerts.
