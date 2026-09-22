# 13. Model Evaluation

## Classification metrics

- precision
- recall
- F1
- ROC-AUC
- PR-AUC

## Regression metrics

- MAE
- RMSE
- R²

## Business context

A single metric is rarely enough.

For maintenance alerts, a team may need to balance:
- missed service events
- false alerts
- operational capacity

## Validation questions

- Is there leakage?
- Is the split appropriate?
- Is the data representative?
- Is the metric aligned with the objective?

## Automobile

Evaluate the predictive-maintenance model on a later holdout period rather than randomly mixing future records into training.
