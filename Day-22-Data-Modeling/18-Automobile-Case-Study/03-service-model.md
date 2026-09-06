# Automobile Service Model

Service is a separate business process.

## Order grain

> One row per service order.

## Line grain

> One row per part/labor line on a service order.

## Core entities

```text
dealer
vehicle
service_order
service_order_part
part
technician
```

## Service states

```text
OPEN
DIAGNOSING
WAITING_FOR_PART
REPAIRING
READY
CLOSED
CANCELLED
```

## Measures

Order-level:

```text
total_cost
labor_hours
warranty_cost
```

Line-level:

```text
quantity
unit_price
discount
```

## Double-counting warning

Joining a service order with three parts creates three rows.

Never sum order-level `total_cost` after that join without controlling the grain.

## Historical context

If dealer or vehicle attributes change over time, use the correct historical dimension version for
the service event.
