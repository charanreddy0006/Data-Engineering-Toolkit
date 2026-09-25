# ADR-001 — Streaming Vehicle Faults

## Context
Fleet operations needs current fault information.

## Decision
Use event streaming and stream processing for the low-latency path.

## Alternative
Daily batch.

## Consequence
Faster updates with more operational complexity.

## Risks
Broker failure, lag, duplicates and schema evolution.
