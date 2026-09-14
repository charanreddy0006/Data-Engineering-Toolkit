# Day 25 — Data Governance 🛡️

A complete, practical learning module for understanding how organizations make data
**trusted, discoverable, secure, compliant, usable, and accountable**.

## Learning Goals

By the end of this module you should be able to:

- Explain data governance in simple and technical terms.
- Distinguish governance from data management, security, privacy, and quality.
- Design centralized, federated, and hybrid governance operating models.
- Define data owners, stewards, custodians, producers, and consumers.
- Build a business glossary and data catalog.
- Understand technical and business lineage.
- Design data classification, retention, sharing, and access policies.
- Govern master/reference data and data contracts.
- Establish quality controls and exception management.
- Measure governance with practical KPIs and scorecards.
- Apply governance to an automobile/connected-vehicle data platform.
- Design a governed data product from source to analytics.

## Core Mental Model

```text
                 DATA GOVERNANCE
                       |
       +---------------+----------------+
       |               |                |
   PEOPLE           PROCESS         TECHNOLOGY
       |               |                |
 owners/stewards   policies/RACI     catalog/lineage
 councils          standards        IAM/quality
 domains           workflows        monitoring
       \               |                /
        +--------------+---------------+
                       |
              TRUSTED DATA PRODUCTS
                       |
       +---------------+----------------+
       |               |                |
    Analytics       Operations       AI/ML
```

## Automobile Example 🚗

A connected-car company may receive:

```text
Vehicle -> Telemetry -> Kafka -> Lakehouse -> Curated Data Product
                                  |
                                  +-> Service Analytics
                                  +-> Warranty Analytics
                                  +-> EV Battery Analytics
                                  +-> Fleet Dashboards
```

Governance answers questions such as:

- Who owns vehicle telemetry?
- What does `vehicle_id` mean?
- Is a VIN sensitive?
- How long may raw location data be retained?
- Which teams can access customer-linked telemetry?
- Which system is authoritative for vehicle model?
- What happens when a producer changes a field?
- How can an analyst discover the certified telemetry dataset?
- Who approves a new data consumer?

## Recommended Study Order

1. Fundamentals
2. Operating model and ownership
3. Metadata, catalog, and lineage
4. Classification and policies
5. Access, privacy, and compliance
6. Quality, MDM, contracts, and change management
7. Lakehouse/cloud governance
8. KPIs and monitoring
9. Automobile case study
10. Capstone projects
11. Interview preparation

## Repository Structure

```text
Day-25-Data-Governance/
├── README.md
├── ROADMAP.md
├── GIT-COMMIT.md
├── PROJECT-CHECKLIST.md
├── FILE-INDEX.md
├── docs/
│   ├── 01-Fundamentals/
│   ├── 02-Operating-Model/
│   ├── 03-Data-Ownership/
│   ├── 04-Metadata/
│   ├── 05-Catalog-and-Discovery/
│   ├── 06-Lineage/
│   ├── 07-Classification/
│   ├── 08-Policies-and-Standards/
│   ├── 09-Access-Governance/
│   ├── 10-Privacy-and-Compliance/
│   ├── 11-Quality-Governance/
│   ├── 12-MDM-and-Reference/
│   ├── 13-Contracts/
│   ├── 14-Lakehouse-Governance/
│   ├── 15-Cloud-Governance/
│   ├── 16-Monitoring-and-Metrics/
│   ├── 17-Automobile/
│   ├── 18-Projects/
│   ├── 19-Architecture/
│   ├── 20-Comparisons/
│   ├── 21-Interview/
│   ├── 22-Cheat-Sheets/
│   └── 23-Resources/
├── examples/
└── automobile-project/
```

> Governance is not a single tool. It is an operating system of **accountability,
> policies, standards, metadata, controls, and decision-making** around data.
