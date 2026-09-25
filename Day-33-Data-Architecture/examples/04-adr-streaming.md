# ADR — Stream Vehicle Faults

## Context
Fault alerts require low latency.

## Decision
Use event streaming for fault ingestion and a durable historical path for analytics.

## Alternative
Daily batch.

## Consequence
Lower alert latency with additional operational complexity.
