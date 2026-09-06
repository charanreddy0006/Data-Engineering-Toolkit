# Project 5 — End-to-End Automobile Analytics Model

## Scope

Model:

- connected vehicles;
- telemetry;
- trips;
- faults;
- service;
- warranty;
- EV charging;
- manufacturing.

## Architecture

```text
Sources
  ↓
Raw
  ↓
Canonical
  ↓
Business domain models
  ↓
Dimensional warehouse
  ↓
BI / ML / APIs
```

## Deliverables

- conceptual model;
- logical model;
- physical DDL;
- sample data;
- SCD;
- quality tests;
- facts/dimensions;
- daily snapshot;
- data dictionary;
- recovery runbook.

## Design questions

- How are late events handled?
- How are duplicate events handled?
- How are identifiers reconciled?
- Which dimensions are conformed?
- What is the retention policy?
- Which models are incremental?
- How are breaking changes released?
