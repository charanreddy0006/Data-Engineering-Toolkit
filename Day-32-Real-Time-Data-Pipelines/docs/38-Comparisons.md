# 38. Comparisons

## Kafka vs Stream Processor
Kafka transports and retains events. A stream processor performs computation and stateful transformations. They are complementary.

## Spark Structured Streaming vs Flink

| Area | Spark Structured Streaming | Flink |
|---|---|---|
| API | Spark/DataFrame oriented | Stream-processing oriented |
| Ecosystem | Strong Spark integration | Strong streaming focus |
| State/Event Time | Supported | Strong focus |
| Choice | Existing Spark stack can matter | Existing Flink stack can matter |

## Batch vs Real-Time
Batch is appropriate when delay is acceptable. Real-time is appropriate when the business requires timely updates.

Choose from latency, correctness, workload, skills, operations and cost.
