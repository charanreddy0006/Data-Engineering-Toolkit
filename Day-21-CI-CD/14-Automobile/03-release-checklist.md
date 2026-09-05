# Automobile Telemetry Release Checklist

## Code

- [ ] Parser tests
- [ ] Validation tests
- [ ] Transformation tests
- [ ] Error handling

## Data

- [ ] Schema compatible
- [ ] Contract validated
- [ ] Duplicate strategy reviewed
- [ ] Idempotency preserved
- [ ] Quality thresholds defined

## Infrastructure

- [ ] Docker build
- [ ] Image scan
- [ ] Kubernetes validation
- [ ] Resources
- [ ] Probes

## Security

- [ ] No secrets in Git
- [ ] Least privilege
- [ ] Registry permissions
- [ ] Deployment identity

## Production

- [ ] Staging smoke test
- [ ] Rollback plan
- [ ] Monitoring
- [ ] Alerts
- [ ] Release notes

Final question:

> If processing fails after 20% of today's telemetry, how will the dataset be recovered safely?
