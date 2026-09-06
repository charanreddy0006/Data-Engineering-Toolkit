# Project 1 — Normalized Automobile OLTP

## Goal

Design a PostgreSQL-style operational model for vehicles and service.

## Tables

```text
vehicle_model
customer
vehicle
dealer
service_order
part
service_order_part
```

## Requirements

- VIN must be unique.
- Vehicle model must exist before vehicle.
- Service order must reference a valid vehicle and dealer.
- Part quantity must be positive.
- Closed service order cannot close before opening.

## Deliverables

- schema.sql;
- seed data;
- transactions;
- relationship diagram;
- integrity tests.
