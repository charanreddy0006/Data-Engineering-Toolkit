# 32. Comparisons

## Training vs Inference

| Training | Inference |
|---|---|
| Learns model | Uses model |
| Historical data | New/current data |
| Produces artifact | Produces prediction |
| Periodic | Batch or online |

## Batch vs Online Inference

| Batch | Online |
|---|---|
| Schedule-driven | Request/event-driven |
| High throughput | Low latency |
| Simpler operations | More serving complexity |
| Daily fleet scoring | Live vehicle request |

## ML Pipeline vs Data Pipeline

Data pipelines focus on reliable movement and transformation. ML pipelines add model training, evaluation, model artifacts, deployment and model-specific monitoring.

## Orchestrator vs Model Registry

An orchestrator controls execution. A model registry manages model artifacts and lifecycle metadata.
