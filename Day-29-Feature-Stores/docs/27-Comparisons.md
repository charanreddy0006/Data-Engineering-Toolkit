# 27. Feature Store Comparisons

## Feature Store vs Data Warehouse

| Area | Feature Store | Data Warehouse |
|---|---|---|
| Main goal | ML feature management/serving | Analytical workloads |
| Online serving | Common requirement | Not usually primary |
| Feature metadata | Central focus | General data metadata |
| Training retrieval | Important | Possible |
| BI dashboards | Not primary | Core use case |

## Feature Store vs Feature Table

A feature table is a data structure containing features. A feature store is broader: it can include metadata, registry, serving, lifecycle and operational capabilities.

## Online Store vs Offline Store

Online:
- low latency
- current/recent features
- serving

Offline:
- historical
- training
- backtesting
- analytical retrieval

## Batch vs Streaming Features

Batch is usually simpler and cheaper for slowly changing signals. Streaming is useful when the business decision requires frequent or near-real-time updates.

## Key Decision

Choose architecture based on:
- freshness requirement
- latency requirement
- volume
- model behavior
- operational maturity
- cost
