# Automobile Architecture

```text
Sensors
  ↓
Vehicle Gateway
  ↓
Event Broker
  ↓
Stream Processing
 ├→ Alert Service
 ├→ Fleet Dashboard
 ├→ Online Feature Store
 └→ Raw Lake
```

Cross-cutting: schemas, authentication, authorization, checkpoints, monitoring and governance.
