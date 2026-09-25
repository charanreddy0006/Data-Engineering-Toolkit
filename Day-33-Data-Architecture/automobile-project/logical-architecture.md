# Logical Architecture

```text
Source Domains
     ↓
Ingestion Services
     ↓
Raw Layer
     ↓
Standardization + Quality
     ↓
Domain Data Products
  ┌────┬─────┬───────┬───────┐
  ↓    ↓     ↓       ↓
Vehicle Service Warranty Charging
  └────┴─────┴───────┴───────┘
              ↓
       Enterprise Analytics
         /                     BI              ML
```

Domain teams own business semantics; platform teams provide reusable infrastructure and controls.
