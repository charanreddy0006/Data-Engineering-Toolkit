# Automobile CI/CD Architecture 🚗

```text
Developer
   ↓
Git Pull Request
   ↓
CI
 ├── Python tests
 ├── SQL tests
 ├── schema checks
 ├── data-quality tests
 ├── Docker build
 └── security scan
   ↓
Container Registry
   ↓
Staging Kubernetes
   ↓
Smoke + telemetry quality
   ↓
Production
   ↓
Monitoring
```

## Production workload mapping

```text
Telemetry API → Deployment
Quality       → Job
Aggregation   → CronJob
Configuration → ConfigMap
Credentials   → Secret manager
```

## Release identity

```text
release 1.8.0
commit abc123
image git-abc123
```

When an incident happens, engineers can trace production behavior back to source.
