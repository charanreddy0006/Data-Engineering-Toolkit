# 6. Consumers

A consumer reads events and performs work.

## Responsibilities
- read
- deserialize
- validate
- transform
- update state/sinks
- track progress
- handle failures

## Metrics
- consumer lag
- throughput
- processing latency
- errors
- restarts

## Automobile
One consumer group can calculate fleet metrics while another independently feeds maintenance ML.

Different groups can consume the same topic for independent purposes.
