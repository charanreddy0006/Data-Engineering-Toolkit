# 10. Dataset Versioning

Model results depend on the training data.

## Track

- dataset version
- extraction time
- source versions
- feature version
- label definition
- code commit

## Example

```text
dataset = training_v12
features = vehicle_health_v4
code = abc123
model = maintenance_v7
```

## Reproducibility

```text
Code + Data + Features + Parameters
                ↓
           Model Artifact
```

## Automobile

When retraining after a fleet expansion, retain the exact dataset and feature metadata used for the new model.

## Goal

Make it possible to answer:
> What data and code produced this model?
