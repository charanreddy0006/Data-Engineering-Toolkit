# 3. Why Feature Stores Exist

## Before Feature Stores

A common pattern is:

```text
Data Team → Training SQL
Data Team → Inference Python
Data Team → Dashboard SQL
```

The same business logic may exist in several places.

## Problems

### Duplication
Multiple teams implement similar features.

### Inconsistency
Training uses one calculation while production serving uses another.

### Poor Discoverability
Analysts cannot easily find existing approved features.

### Operational Complexity
Production models need fresh feature values at prediction time.

### Weak Governance
It becomes difficult to answer:
- Who owns this feature?
- Where did it come from?
- What does it mean?
- When was it last updated?

## Feature Store Contribution

```text
                 ┌───────────────┐
                 │ Feature Store │
                 └───────┬───────┘
                         │
          ┌──────────────┼──────────────┐
          ↓              ↓              ↓
      Training       Inference       Discovery
```

## Important

A feature store does not automatically solve bad data. It gives the organization a place to manage features systematically; source quality and pipeline design still matter.
