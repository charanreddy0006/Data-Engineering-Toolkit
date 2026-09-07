# JSONL Streaming

JSONL stores one complete JSON value per line.

```json
{"event_id":"e1","vehicle_id":"V100","speed_kph":42.1}
{"event_id":"e2","vehicle_id":"V100","speed_kph":44.3}
{"event_id":"e3","vehicle_id":"V101","speed_kph":31.2}
```

## Why JSONL is useful

A consumer can process one line without loading an entire document.

```python
import json

with open("telemetry.jsonl", encoding="utf-8") as f:
    for line_number, line in enumerate(f, start=1):
        if not line.strip():
            continue

        event = json.loads(line)
        print(event["event_id"])
```

## Failure isolation

A production parser should identify:

```text
line number
source file
error
schema version
```

for malformed records.

## Automobile scenario

A gateway exports thousands of telemetry events.

One malformed event should be quarantined according to policy instead of making it impossible to
process every valid event.

## JSON array vs JSONL

Array:

```json
[
  {"id":1},
  {"id":2}
]
```

JSONL:

```text
{"id":1}
{"id":2}
```

JSONL is especially convenient for append-oriented event pipelines.
