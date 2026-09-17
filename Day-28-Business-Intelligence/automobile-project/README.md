# 🚗 Automobile BI Capstone — Connected Vehicle & Service Intelligence

## Business Goal
Create a governed BI solution that combines service, vehicle, dealer, warranty and connected-vehicle information.

## Personas
- Executive
- Regional manager
- Dealer manager
- Fleet operations analyst
- Service analyst

## Business Questions
### Executive
- What is service revenue?
- How is revenue trending?
- Which regions contribute most?

### Service
- Which dealers have high repair volume?
- What is average repair order value?
- Which models require more service?

### Warranty
- What is warranty claim rate?
- Which components generate claims?

### Connected Vehicle
- How many vehicles are active?
- What is average distance per day?
- Which vehicles report frequent faults?

## Architecture
```text
Vehicle / Dealer / Service / Warranty / EV
                  ↓
             Ingestion
                  ↓
             Lakehouse
                  ↓
          Transform + Quality
                  ↓
          BI Warehouse/Marts
                  ↓
          Semantic Model
                  ↓
       Power BI / Tableau / Looker
```

## Production Evolution
Start with batch SQL and a warehouse. At larger scale, introduce object storage, event streaming, Spark/dbt, orchestration, governance and observability.

## Deliverables
- Star schema
- KPI dictionary
- Security model
- Refresh strategy
- Performance plan
- Monitoring plan
- Dashboard specification
