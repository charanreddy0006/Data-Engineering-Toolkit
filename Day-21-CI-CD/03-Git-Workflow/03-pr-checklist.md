# Pull Request Checklist

## Code

- [ ] Formatting
- [ ] Lint
- [ ] Unit tests
- [ ] Error handling
- [ ] Useful logs

## Data

- [ ] SQL reviewed
- [ ] Schema compatibility checked
- [ ] Data-quality rules considered
- [ ] Idempotency preserved

## Infrastructure

- [ ] Dockerfile reviewed
- [ ] Kubernetes manifests validated
- [ ] Resource settings reviewed
- [ ] No secrets committed

## Release

- [ ] Artifact version clear
- [ ] Rollback possible
- [ ] Monitoring available

## Key review question

> What happens if this change fails after processing part of the data?
