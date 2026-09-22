# Retraining Strategy

## Scheduled
Create a candidate model weekly.

## Triggered
Investigate retraining after:
- measured performance decline
- major drift
- feature logic change
- source changes
- new vehicle generation

## Flow

```text
Trigger → Dataset → Train → Evaluate
       → Compare → Approve → Register → Deploy
```

Never bypass validation merely because retraining was triggered automatically.
