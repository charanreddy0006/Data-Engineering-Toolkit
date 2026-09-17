# 6. Measures and KPIs

## Measure
A numeric value used in analysis.

Examples:
- Sales amount
- Distance
- Energy consumption
- Service cost
- Number of claims

## KPI
A KPI is a defined business indicator used to monitor an objective.

Example:
**Warranty Claim Rate**
```text
warranty_claims / eligible_vehicles × 100
```

## KPI Definition Template
```text
Name:
Business Meaning:
Formula:
Grain:
Source:
Owner:
Refresh:
Target:
Warning Threshold:
```

## Additive Types
**Additive:** can be summed across dimensions, such as revenue.

**Semi-additive:** can be summed across some dimensions but not time, such as account balance.

**Non-additive:** ratios and percentages should usually be recalculated rather than summed.

## Automobile KPIs
- Vehicles sold
- Service revenue
- Average repair order value
- Warranty claim rate
- Fleet utilization
- Average daily distance
- EV energy consumption
- Charging sessions
- Dealer service retention

## KPI Governance
Never allow two dashboards to define "active vehicle" differently without explicit documentation.
