# 20. Embedded BI

## Definition
Embedded BI places analytics inside another application.

Example:
A dealership management application contains a service-performance dashboard without requiring users to open a separate BI portal.

## Architecture
```text
User
 ↓
Business Application
 ↓
Embedding Layer
 ↓
BI Platform
 ↓
Semantic Model
 ↓
Warehouse
```

## Use Cases
- Customer portals
- Dealer portals
- SaaS products
- Operations applications
- Fleet management platforms

## Security
Embedding must preserve user identity and authorization. Never rely on hiding UI controls as a security boundary.

## Automobile Example
A fleet-management SaaS product embeds a vehicle utilization dashboard for each customer account.
