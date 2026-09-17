# 14. Power BI

## Overview
Power BI is Microsoft's business analytics platform for data modeling, visualization, reporting and sharing.

## Important Concepts
- Power BI Desktop
- Semantic model
- Reports
- Dashboards
- Workspaces
- Dataflows
- DAX
- Power Query
- Row-level security
- Scheduled refresh
- Power BI Service

## Typical Flow
```text
Database
   ↓
Power Query
   ↓
Model
   ↓
DAX Measures
   ↓
Report
   ↓
Power BI Service
```

## DAX Example
```text
Total Service Revenue =
SUM(fact_service[service_amount])
```

## Learning Focus
Understand data modeling and metric definitions before learning advanced visual formatting.

## Official Documentation
https://learn.microsoft.com/power-bi/
https://learn.microsoft.com/dax/
