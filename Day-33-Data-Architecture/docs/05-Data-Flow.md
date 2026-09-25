# 5. Data Flow

A data flow explains how information travels.

```text
Source
 ↓
Ingest
 ↓
Raw
 ↓
Quality
 ↓
Transform
 ↓
Curated
 ↓
Serve
 ↓
Consumer
```

Ask:
- where does data originate?
- where is it validated?
- can it be replayed?
- who owns each stage?
- where are failures handled?

## Automobile
Telemetry can flow from vehicle gateway to event platform, raw storage, stream processing and fleet analytics.
