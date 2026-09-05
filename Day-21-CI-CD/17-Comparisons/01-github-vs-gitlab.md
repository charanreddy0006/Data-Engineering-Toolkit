# GitHub Actions vs GitLab CI

| Concept | GitHub Actions | GitLab CI |
|---|---|---|
| Config | `.github/workflows/` | `.gitlab-ci.yml` |
| Jobs | Yes | Yes |
| Runners | Yes | Yes |
| Artifacts | Yes | Yes |
| Environments | Yes | Yes |
| Secrets | Yes | Yes |

The concepts transfer:

```text
trigger
job
runner
artifact
secret
environment
deployment
```

Choose based on organizational ecosystem and requirements.
