# Prometheus, Grafana and OpenTelemetry

## Prometheus

Prometheus is widely used for time-series metrics collection, querying, and alerting.

```text
Targets → Prometheus → Query
                 ↓
             Alert Rules
                 ↓
            Alertmanager
```

## Grafana

Grafana provides dashboards and visualization across supported data sources.

## OpenTelemetry

OpenTelemetry provides vendor-neutral instrumentation and collection patterns for
metrics, traces, and logs.

```text
Application
    ↓
OpenTelemetry SDK/Agent
    ↓
Collector
    ↓
Observability Backend
```

## Design Principle

Instrument applications once where practical and keep the backend choice separate
from instrumentation.
