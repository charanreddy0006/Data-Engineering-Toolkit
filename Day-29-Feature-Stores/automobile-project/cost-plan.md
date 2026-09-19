# Cost Plan

## Offline

Use partitioned historical data and efficient analytical formats.

## Online

Materialize only features required by online models.

## Frequency

Match update frequency to business value.

Example:
```text
battery_soc_latest → minutes
distance_km_30d → daily
service_spend_365d → daily
```

## Backfills

Use bounded windows and monitor compute consumption.

## Review

Review high-cardinality, high-frequency and unused features regularly.
