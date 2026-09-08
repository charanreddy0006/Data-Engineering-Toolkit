# Quarantine Pattern

Bad records should often be isolated rather than silently discarded.

```text
Raw input
   |
   +---- valid ----> curated
   |
   +---- invalid --> quarantine
                         |
                         +--> reason
                         +--> rule ID
                         +--> source
                         +--> batch
                         +--> retryable?
```

A quarantine record should preserve the original payload where permitted, plus:

- source
- ingestion time
- batch ID
- rule ID
- reason code
- validation timestamp
- retryable flag

Example:

```json
{
  "vehicle_id": null,
  "speed_kmh": 88,
  "_dq_rule": "DQ-TEL-001",
  "_dq_reason": "MISSING_VEHICLE_ID",
  "_dq_batch_id": "2026-09-08-1900",
  "_dq_retryable": false
}
```

Quarantine enables audit, debugging, producer feedback, and replay.
