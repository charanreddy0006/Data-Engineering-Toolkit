# 40. Architecture Decision Records

ADRs capture important architecture choices.

## Template
```text
Title
Date
Status
Context
Decision
Alternatives
Consequences
Risks
```

## Example
Decision: use event streaming for connected-vehicle faults.

Context: alerts need low latency.

Alternative: daily batch.

Consequence: faster response with more operational complexity.

## Value
Future engineers can understand why a design was selected.
