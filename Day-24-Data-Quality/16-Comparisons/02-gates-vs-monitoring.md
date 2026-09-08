# Quality Gates vs Monitoring

## Gate

Makes a processing decision:

```text
PASS -> publish
FAIL -> block/quarantine
```

## Monitoring

Observes health:

```text
quality = 99.2%
freshness = 12 min
```

Use both. A gate protects consumers from known-bad data; monitoring identifies trends and unexpected degradation.

Monitoring should not replace deterministic safety controls.
