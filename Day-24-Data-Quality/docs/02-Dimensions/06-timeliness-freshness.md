# Timeliness and Freshness

Freshness measures how recently data was updated. Timeliness asks whether it arrived within the required business window.

```sql
SELECT CURRENT_TIMESTAMP - MAX(ingestion_time)
FROM vehicle_telemetry;
```

Distinguish:

```text
event_time       = event created by vehicle
ingestion_time   = received by platform
processing_time  = transformed
publication_time = made available
```

Their differences reveal where latency occurs.

Example:

```text
event -> ingestion     2 min
ingestion -> process   1 min
process -> publish     2 min
total                  5 min
```

A freshness SLO might require 99% of hourly partitions to arrive within 10 minutes.

Late data can be valid. Do not automatically classify lateness as corruption.
