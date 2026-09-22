# 7. Preprocessing

Common operations:

- missing values
- encoding
- scaling
- type conversion
- outlier treatment
- timestamp normalization

## Consistency

Training and inference must use the same preprocessing logic.

```text
Training → Shared preprocessing → Model
Inference → Shared preprocessing → Model
```

## Example

Standardization:

```text
z = (x - mean) / standard_deviation
```

The required parameters must be retained with the pipeline/model artifact.

## Automobile example

Normalize mileage units, validate negatives, handle missing battery readings and standardize timestamps.

## Common mistake

Doing preprocessing manually in a notebook and forgetting to reproduce it in production.
