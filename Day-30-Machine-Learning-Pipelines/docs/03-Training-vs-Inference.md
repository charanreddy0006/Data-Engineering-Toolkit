# 3. Training vs Inference

## Training

Learns model parameters from historical data.

```text
Historical Data
 → Features + Labels
 → Training
 → Model Artifact
```

## Inference

Uses a trained model on new data.

```text
New Data
 → Features
 → Model
 → Prediction
```

| Area | Training | Inference |
|---|---|---|
| Data | Historical | New/current |
| Output | Model | Prediction |
| Trigger | Schedule/on demand | Batch/request |
| Evaluation | Before promotion | Continuous monitoring |

## Automobile

Training uses historical faults and service outcomes.

Inference scores current vehicles for service risk.
