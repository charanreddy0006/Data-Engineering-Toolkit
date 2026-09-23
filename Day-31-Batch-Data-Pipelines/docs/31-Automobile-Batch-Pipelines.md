# 31. Automobile Batch Pipelines 🚗

## Daily Sales

```text
Dealer Sales
 ↓
Incremental Extract
 ↓
Quality
 ↓
Curated Sales
 ↓
Sales Mart
```

## Service

```text
Service Orders
 ↓
Deduplicate
 ↓
Revenue Calculation
 ↓
Service Mart
```

## Warranty

```text
Claims
 ↓
Vehicle/Dealer Enrichment
 ↓
Daily Claim Aggregates
```

## EV Charging

```text
Charging Sessions
 ↓
Daily Aggregation
 ↓
Energy Metrics
 ↓
EV Dashboard
```

## Manufacturing

Plant files can be staged, validated and aggregated by plant, model and shift.
