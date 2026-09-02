# Data Modeling Best Practices


## 1. Start With Business Processes

Do not start with source tables.

Ask:

```text
What process are we measuring?
```

## 2. Declare Grain

Write:

```text
One row = ...
```

before creating a fact table.

## 3. Keep Facts at One Grain

Avoid mixed-grain facts.

## 4. Reuse Conformed Dimensions

Use shared:

```text
Date
Vehicle
Customer
Dealer
Location
```

where definitions genuinely align.

## 5. Separate Current State and History

If users need historical analysis, choose an explicit history strategy.

## 6. Use Meaningful Names

Prefer:

```text
vehicle_key
service_cost
event_time
```

over:

```text
id
cost
time
```

when ambiguity exists.

## 7. Document Business Definitions

For example:

```text
Net Revenue =
Gross Revenue - Discount + Applicable Adjustments
```

The exact formula must be agreed with business owners.

## 8. Design for Query Patterns

A model is not evaluated only by elegance. It must support actual workloads.

## 9. Protect Source Systems

Do not make BI users run heavy queries against production OLTP systems.

## 10. Plan for History

Ask:

```text
What changes?
Do we need old values?
How long do we keep them?
```

## 11. Handle Unknown Members

Define a strategy for late-arriving dimensions.

## 12. Enforce Quality

Use:

```text
NOT NULL
UNIQUE
CHECK
relationship tests
pipeline tests
```

where appropriate.

## 13. Consider Security

Do not expose unnecessary PII.

## 14. Version Schema Changes

Treat schema changes as contracts.

## 15. Keep Source IDs

Even when surrogate keys are used, preserve useful source identifiers for
traceability and reconciliation.

## 16. Avoid Overengineering

Do not use Data Vault, bridges, mini-dimensions, or complex snapshots unless
they solve real problems.

## 17. Optimize With Evidence

Use:

```text
query plans
metrics
profiling
load tests
```

rather than intuition alone.

## 18. Design for Failure

Consider:

```text
late data
duplicates
reprocessing
backfills
source outages
schema changes
```

## 19. Make Ownership Clear

Every important model should have an owner.

## 20. Review Before Production

Review:

```text
Meaning
Grain
Keys
History
Quality
Security
Performance
Lineage
Documentation
```

## Golden Checklist

```text
[ ] Business process
[ ] Grain
[ ] Entities
[ ] Relationships
[ ] Keys
[ ] Facts
[ ] Dimensions
[ ] SCD
[ ] Quality
[ ] Security
[ ] Performance
[ ] Ownership
[ ] Documentation
```
