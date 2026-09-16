# Distributed Tracing

## Trace

A trace represents one logical operation across multiple components.

## Span

A span represents one unit of work inside a trace.

```text
API
 └─ Auth
     └─ Query Service
         └─ Database
```

Each stage can create a span.

## Correlation

A correlation/trace identifier helps connect logs, traces, and related events.

## Data Pipeline Example

```text
Read Source → Validate → Transform → Write → Publish
    span         span       span       span      span
```

Tracing is especially valuable when one request or workflow crosses many services.
