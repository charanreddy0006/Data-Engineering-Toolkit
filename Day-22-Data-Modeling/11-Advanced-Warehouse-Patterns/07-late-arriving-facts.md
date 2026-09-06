# Late-Arriving Facts

A fact can arrive after the reporting period.

Example:

```text
Trip occurred: 23:55
Arrived in warehouse: 00:20 next day
```

If daily reporting is based only on ingestion date, the trip may appear in the wrong day.

## Solution

Use business event time for business reporting:

```text
event_time
```

and ingestion time for pipeline operations:

```text
ingestion_time
```

## Backfill

A daily aggregate may need a lookback window to capture late arrivals.

Example concept:

```text
reprocess recent N days
```

Choose N from observed lateness and business requirements.

## Recovery

Late-arriving data should be replayable without producing duplicate facts.
