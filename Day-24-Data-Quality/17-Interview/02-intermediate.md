# Intermediate Interview Questions

## Q1. How would you quality-check a 10 TB table?

Use partition-aware checks, metadata, distributed aggregations, targeted business rules, and sampling for expensive checks. Never collect the whole dataset to the driver.

## Q2. How do you handle bad records?

Classify by severity, quarantine when needed, preserve reason codes, and support replay.

## Q3. How do you detect a source outage?

Combine freshness, volume, heartbeat, and distribution signals against expected operating behavior.

## Q4. How do you choose thresholds?

Business impact, historical baseline, consumer tolerance, and contractual requirements.

## Q5. Why is schema validation insufficient?

It validates structure, not necessarily accuracy, freshness, uniqueness, or business correctness.

## Q6. How do data contracts help?

They move expectations toward the producer and make breaking changes visible before downstream impact.

## Q7. How do you validate telemetry?

Identity, timestamp, ranges, duplicates, references, freshness, fleet coverage, and temporal/business rules.
