# 17. Online Inference

Online inference generates predictions in response to requests or events.

```text
Request
 ↓
Feature Lookup
 ↓
Preprocessing
 ↓
Model
 ↓
Prediction
```

## Requirements

- low latency
- availability
- timeouts
- authentication
- fresh features
- metrics

## Example

A severe vehicle-fault event triggers an API request for a maintenance-risk score.

## Batch vs Online

Batch is schedule-driven. Online is request/event-driven.

Choose the pattern from the required business latency rather than assuming online is always better.
