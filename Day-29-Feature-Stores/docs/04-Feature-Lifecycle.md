# 4. Feature Lifecycle

## Lifecycle

```text
Idea
 ↓
Definition
 ↓
Development
 ↓
Validation
 ↓
Registration
 ↓
Materialization / Serving
 ↓
Monitoring
 ↓
Versioning
 ↓
Retirement
```

## 1. Idea
Identify a business or ML problem.

## 2. Definition
Specify:
- name
- entity
- data type
- logic
- timestamp
- owner
- expected freshness

## 3. Development
Implement the transformation.

## 4. Validation
Test correctness and leakage.

## 5. Registration
Document the feature in the feature catalog/registry.

## 6. Serving
Make values available to training or inference.

## 7. Monitoring
Check freshness, distribution and failures.

## 8. Versioning
Track meaningful changes.

## 9. Retirement
Remove unused features carefully.

## Automobile Example

Feature:
`battery_fast_charge_ratio_30d`

Possible definition:
```text
fast_charging_sessions_30d / total_charging_sessions_30d
```

Before release, define exactly what qualifies as a fast-charge session.
