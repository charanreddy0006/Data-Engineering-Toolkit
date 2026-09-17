# 13. Self-Service BI

## Definition
Self-service BI allows business users to explore governed data without depending on engineering for every report.

## Two Models

### Uncontrolled Self-Service
Users connect directly to many operational sources and create independent metrics.

Risk:
- Duplicate definitions
- Security issues
- Poor performance
- Data quality problems

### Governed Self-Service
Central teams provide trusted datasets, semantic models and security while users create their own analysis.

## Governed Self-Service Architecture
```text
Certified Data Products
        ↓
Semantic Models
        ↓
Business Users
        ↓
Personal / Team Analysis
```

## Best Practices
- Certified datasets
- Data catalog
- Metric definitions
- Workspace standards
- Access controls
- Training
- Usage monitoring

## Automobile Example
Regional dealer managers receive a certified service dataset and can analyze their own dealer without accessing another region's customer information.
