# 5. Feature Store Architecture

## High-Level Architecture

```text
Sources
 ├── Data Warehouse
 ├── Data Lake
 ├── Operational DB
 └── Event Stream
        ↓
Feature Pipelines
 ├── Batch
 └── Streaming
        ↓
Feature Store
 ├── Registry / Metadata
 ├── Offline Store
 └── Online Store
        ↓
 ┌──────────────┬───────────────┐
 ↓              ↓
Training     Online Inference
```

## Components

### Source Layer
Contains raw operational or analytical data.

### Transformation Layer
Calculates feature values.

### Registry
Stores definitions and metadata.

### Offline Store
Historical feature values used mainly for training and analysis.

### Online Store
Low-latency feature values used for online inference.

### Materialization
Moves selected feature values from offline/historical computation into an online serving layer.

## Design Goal

The system should allow a feature definition to remain consistent from historical training data to production inference.

## Automobile Example

```text
Vehicle Telemetry → Stream Processing → Online Features
                  ↘ Batch Warehouse → Offline Features
```
