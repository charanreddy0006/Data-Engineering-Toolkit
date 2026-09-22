# 12. Model Training

## Inputs

- training dataset
- features
- labels
- configuration

## Flow

```text
Training Data
 ↓
Train / Validation Split
 ↓
Algorithm
 ↓
Model Artifact
```

## Reproducibility

Control:
- parameters
- dependency versions
- random seeds where appropriate
- training data version
- feature version

## Example configuration

```yaml
algorithm: gradient_boosting
random_seed: 42
learning_rate: 0.05
```

## Automobile

A binary classifier can predict:
`service_required_within_7d`.

Do not select an algorithm solely because it is popular; match it to the task and data.
