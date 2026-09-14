# Data Governance vs Data Management

## Purpose
Separate decision rights from day-to-day execution.

## Governance

Governance defines **what should happen, who decides, and what standards apply**.

Examples:
- classification policy
- ownership model
- retention standard
- approved data-sharing rules
- quality expectations

## Management

Data management performs the operational work required to collect, store, transform,
secure, integrate, and use data.

Examples:
- loading a warehouse
- fixing a broken pipeline
- tuning a query
- creating a table
- operating a catalog

## Relationship

```text
Governance
   |
   +--> defines policy and accountability
             |
             v
Data Management
   |
   +--> executes controls and operations
             |
             v
Evidence / Metrics
   |
   +--> feeds governance decisions
```

## Common Interview Trap

Governance is not merely a catalog, security tool, or committee. Those can support
governance, but governance is broader.
