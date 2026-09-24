# 39. Interview Questions

## Beginner
1. What is streaming?
2. Batch vs streaming?
3. What is an event?
4. Producer vs consumer?
5. Topic vs partition?
6. What is consumer lag?

## Intermediate
1. Event time vs processing time?
2. What are windows?
3. What is a watermark?
4. What is stateful processing?
5. How do you handle duplicates?
6. What is backpressure?
7. What is a consumer group?

## Advanced
1. Design a connected-vehicle pipeline at large event volume.
2. Handle out-of-order events.
3. Avoid hot partitions.
4. Design recovery from processor failure.
5. Explain end-to-end exactly-once limitations.

## Scenario
Telemetry lag suddenly increases:
source burst → broker rate → partitions → consumers → processing latency → state → sink.
