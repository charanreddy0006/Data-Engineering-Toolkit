# Automobile Telemetry CI/CD Project 🚗

## Objective

Create a production-inspired release pipeline for connected-vehicle telemetry.

## Architecture

```text
Vehicles
   ↓
Gateway
   ↓
Telemetry API
   ↓
Kafka
   ↓
Flink/Spark
   ├── alerts
   ├── raw lake
   └── aggregates
            ↓
       warehouse/API
```

## CI/CD

```text
PR
 ↓
Python + SQL + schema tests
 ↓
Docker build
 ↓
security scan
 ↓
registry
 ↓
staging Kubernetes
 ↓
smoke + quality
 ↓
production
```

## Kubernetes mapping

```text
API → Deployment
Quality → Job
Aggregation → CronJob
Config → ConfigMap
Secrets → secure secret management
```

## Portfolio questions

- Why Deployment?
- Why Job?
- How is the artifact versioned?
- How is a duplicate prevented?
- What happens if a Pod fails?
- How is a bad data release recovered?
