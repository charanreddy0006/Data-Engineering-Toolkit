# Observability Architecture

```text
              DATA PLATFORM
Sources → Ingestion → Processing → Storage → Products
   |          |          |           |         |
 metrics    metrics    metrics     metrics   freshness
 logs       logs       logs        logs      quality
 traces     traces     traces      traces    SLO
   +----------+----------+-----------+---------+
                         ↓
              Collectors / Agents
                         ↓
             Observability Backend
                 /      |       \
             Metrics    Logs    Traces
                 \      |       /
                   Dashboards
                       ↓
                     Alerts
                       ↓
                Incident Response
                       ↓
                   Postmortem
```

## Data Observability Layer

```text
Freshness + Volume + Schema + Distribution + Quality + Lineage
                              ↓
                       Data Product Health
```

Observability should itself be resilient: losing the observability backend should
not silently remove all operational awareness.
