# CI vs Continuous Delivery vs Continuous Deployment

| Practice | Meaning |
|---|---|
| CI | Frequently integrate and automatically validate |
| Continuous Delivery | Keep changes releasable and automate delivery |
| Continuous Deployment | Automatically release validated changes |

## CI

```text
commit → test → build
```

## Delivery

```text
commit → test → build → staging → production-ready
```

## Deployment

```text
commit → test → build → staging → verify → production
```

## Risk-based choice

A regulated or high-risk platform may use approval gates.

A low-risk service may use automatic production deployment.

For data engineering, production schema changes often deserve stronger controls than a documentation change.
