# 36. Automobile Real-Time Pipelines 🚗

## Connected Vehicle
```text
Sensors → Gateway → Kafka → Stream Processing
                         ├→ Fault Alerts
                         ├→ Fleet Metrics
                         ├→ Online Features
                         └→ Data Lake
```

## Fault Detection
Validate fault event → enrich vehicle → classify severity → publish alert.

## EV
Charging events update session state and real-time energy dashboards.

## Driver Behavior
Windowed harsh-braking and acceleration metrics can support fleet safety workflows.

Keep raw events, processed streams and serving outputs logically separated.
