# 16. Looker

## Overview
Looker is a Google Cloud BI and analytics platform with a modeling approach centered around LookML.

## Key Concepts
- LookML
- Models
- Explores
- Dimensions
- Measures
- Dashboards
- Looker Studio is a separate product

## Conceptual Flow
```text
Warehouse
    ↓
LookML Model
    ↓
Explores
    ↓
Measures / Dimensions
    ↓
Dashboards
```

## Why Modeling Matters
Business definitions can be centralized in the modeling layer instead of recreated by every dashboard author.

## Automobile Example
A fleet Explore could expose vehicle, dealer, trip and service dimensions with reusable fleet measures.

## Official Documentation
https://cloud.google.com/looker/docs
