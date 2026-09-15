# Automotive Threat Model
| Asset | Threat | Impact | Control |
|---|---|---|---|
| Telemetry | unauthorized read | confidentiality | topic ACL + IAM |
| Telemetry | tampering/injection | integrity | authenticated producer + validation |
| Customer location | excessive access | privacy/security | fine-grained access + minimization |
| Pipeline credential | theft | broad compromise | secret manager + workload identity |
| Data lake | public exposure | disclosure | public-access prevention + policy |
| Backup | unauthorized access | disclosure/recovery risk | encryption + separate access |
| CI/CD | compromised build | production compromise | protected pipeline + scanning |
