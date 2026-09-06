# Warranty Data Model

Warranty is a separate business process.

## Claim grain

> One row per warranty claim.

Possible attributes:

```text
claim_id
vehicle_id
dealer_id
claim_date
failure_code
repair_code
claim_status
```

Possible measures:

```text
parts_cost
labor_cost
total_cost
```

## Analytics

- warranty cost by model;
- claims per 1,000 vehicles;
- failure-code frequency;
- claim cost by dealer;
- time from vehicle delivery to claim.

## Historical context

If model, dealer, or ownership attributes change, use the dimension version valid at claim time.

## Quality

- unique claim ID;
- valid vehicle;
- non-negative costs;
- valid claim status;
- valid claim date.
