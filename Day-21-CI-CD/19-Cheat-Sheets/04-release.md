# Release Checklist

## CI

- [ ] Tests pass
- [ ] Lint passes
- [ ] Security passes
- [ ] Artifact built
- [ ] Artifact identity recorded

## CD

- [ ] Staging deployed
- [ ] Smoke test passed
- [ ] Data-quality gate passed
- [ ] Production policy satisfied
- [ ] Exact artifact promoted

## Production

- [ ] Monitoring
- [ ] Rollback
- [ ] Migration compatibility
- [ ] Release notes
- [ ] Recovery plan

## Data

- [ ] Idempotency
- [ ] Schema compatibility
- [ ] Freshness
- [ ] Duplicate detection
