# Automotive Data Governance Capstone 🚗

## Scenario

A connected-vehicle manufacturer operates a platform receiving telemetry from vehicles
and combining it with vehicle master, customer, service, warranty, dealer, and EV
battery data.

The company wants governed data products for engineering and analytics.

## Target Architecture

```text
Vehicles
   |
Telematics
   |
Kafka / Events
   |
Bronze ---------------- Vehicle Master
   |                           |
   v                           v
Silver ----------- Identity Resolution
   |
   +----------+-----------+------------+
   |          |           |            |
Telemetry    EV       Warranty      Service
Product     Product     Product       Product
   |
Catalog / Glossary / Lineage / Quality / Policy
   |
Approved Consumers
```

## Capstone Deliverables

- governance charter
- RACI
- classification
- access policy
- data contract
- retention policy
- catalog
- lineage
- KPI SQL
- operational runbook

## Portfolio Story

The goal is not to claim that a YAML file is governance. The goal is to show how
business accountability becomes technical controls and measurable evidence.
