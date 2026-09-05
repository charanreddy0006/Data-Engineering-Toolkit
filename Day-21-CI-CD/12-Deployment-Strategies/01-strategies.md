# Deployment Strategies

## Recreate

Stop old version and start new version. Simple, but can cause downtime.

## Rolling

Gradually replace old Pods.

```text
A A A
↓
A A B
↓
A B B
↓
B B B
```

## Blue-green

```text
Blue = current
Green = new
```

Validate Green, then switch traffic.

## Canary

Expose a small percentage first:

```text
1% → 5% → 25% → 50% → 100%
```

## Data engineering

API canaries are often easier than data migration canaries. Data writes need idempotency, compatibility and recovery plans.
