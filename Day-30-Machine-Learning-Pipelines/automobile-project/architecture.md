# Capstone Architecture

```text
 ┌──────────── Automotive Sources ────────────┐
 │ Telemetry │ Service │ Warranty │ Vehicle  │
 └────────────────────┬───────────────────────┘
                      ↓
                Data Ingestion
                      ↓
               Raw Data Layer
                      ↓
              Quality Validation
                      ↓
             Feature Engineering
                      ↓
                Feature Store
                /           \
               ↓             ↓
           Offline         Online
               ↓             ↓
          Training       Inference
               ↓             ↑
         Model Registry ─────┘
               ↓
           Deployment
               ↓
          Predictions
               ↓
          Monitoring
               ↓
          Retraining
```
