# Capstone Pipeline

## Training

```text
validate_sources
      ↓
build_features
      ↓
validate_features
      ↓
create_training_dataset
      ↓
train_candidate
      ↓
evaluate_candidate
      ↓
compare_baseline
      ↓
register_candidate
      ↓
approval
      ↓
deploy
```

## Batch Scoring

```text
refresh_features
      ↓
validate_freshness
      ↓
load_model
      ↓
score_vehicles
      ↓
write_predictions
      ↓
publish_results
```
