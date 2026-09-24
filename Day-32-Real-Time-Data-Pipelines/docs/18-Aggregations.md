# 18. Real-Time Aggregations

Streaming pipelines calculate:
- count
- sum
- average
- min/max
- rates
- window statistics

## Automobile
```text
faults_per_minute
vehicles_online
charging_sessions_5m
average_speed_1m
```

## Design contract
Specify key, window, timestamp, aggregation, lateness and destination.

Distinct and large-state aggregations may require significantly more resources than simple counts.
