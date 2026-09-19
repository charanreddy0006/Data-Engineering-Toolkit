# 28. Feature Store Interview Questions

## Beginner

1. What is a feature?
2. What is feature engineering?
3. What is a feature store?
4. Why do ML teams use feature stores?
5. What is an offline store?
6. What is an online store?
7. What is a feature registry?
8. What is feature freshness?

## Intermediate

1. Explain point-in-time correctness.
2. What is training-serving skew?
3. What is materialization?
4. How do batch and streaming features differ?
5. Why is feature versioning important?
6. What is feature lineage?
7. How do you monitor a feature?
8. How do you handle late-arriving data?

## Advanced

1. Design a feature store for millions of vehicles.
2. How would you guarantee point-in-time correctness?
3. How would you handle online store outages?
4. How would you reduce online feature costs?
5. How would you migrate a feature definition without breaking models?

## Scenario

A predictive-maintenance model works well offline but performs poorly after deployment.

Investigate:
- training-serving skew
- feature freshness
- missing online values
- timezone mismatch
- different null handling
- point-in-time logic
- model input order
- source pipeline failures
