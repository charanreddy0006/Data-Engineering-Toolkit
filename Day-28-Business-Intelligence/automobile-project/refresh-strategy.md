# Refresh Strategy

## Service Data
Daily incremental refresh with a short correction window.

## Connected Vehicle Data
Hourly or near-real-time aggregate refresh depending on business requirement.

## Warranty
Daily refresh with historical corrections supported.

## Incremental Pattern
```text
Raw Events
   ↓
Latest ingestion window
   ↓
Quality checks
   ↓
Incremental transformation
   ↓
BI aggregate
   ↓
Semantic model refresh
```

## Failure Handling
- Retry transient failures.
- Do not publish incomplete data.
- Keep previous successful dataset when appropriate.
- Alert owners on missed refresh SLA.
- Validate row counts and freshness after refresh.
