# Project 2 — JSONL Quality Pipeline

Process JSON Lines one record at a time.

Validate:

- event_id
- vehicle_id
- event_time
- speed
- SOC

Invalid events go to a quarantine JSONL file.

Extensions:

- rule counters
- batch IDs
- invalid-rate thresholds
- DLQ simulation
- schema versioning
