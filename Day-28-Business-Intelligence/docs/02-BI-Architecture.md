# 2. BI Architecture

## Traditional Architecture
```text
ERP / CRM / Applications
          ↓
       ETL Jobs
          ↓
   Enterprise Warehouse
          ↓
      Data Marts
          ↓
      BI Reports
```

## Modern Architecture
```text
Apps + APIs + Events + Files
            ↓
     Ingestion Platform
            ↓
     Lake / Lakehouse
            ↓
     Transformations
            ↓
 Warehouse / Serving Layer
            ↓
 Semantic / Metrics Layer
            ↓
      BI Applications
```

## Main Components

### Source Systems
Examples include ERP, CRM, dealership systems, service systems, IoT platforms and payment systems.

### Ingestion
Moves data using batch or streaming methods.

### Storage
Data lakes and warehouses store raw and curated data.

### Transformation
SQL, dbt, Spark or other engines clean and model data.

### Semantic Layer
Provides reusable definitions for dimensions, measures and business metrics.

### BI Layer
Power BI, Tableau, Looker and Apache Superset can consume governed analytical data.

## Batch vs Streaming
Batch processes data periodically. Streaming processes events continuously or near real time.

## Automobile Architecture
```text
Vehicles ──┐
Dealers ───┤
Service ───┼→ Lakehouse → Warehouse → Semantic Layer → Fleet BI
Warranty ──┤
Charging ──┘
```

## Design Principle
BI tools should not become the primary place for complex data engineering. Transform and govern data upstream wherever practical.
