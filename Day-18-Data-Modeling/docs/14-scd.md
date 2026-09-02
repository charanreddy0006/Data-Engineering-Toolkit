# Slowly Changing Dimensions


## Why SCD Exists

Dimension attributes change.

Examples:

```text
Customer changes city
Dealer changes region
Vehicle changes owner
Customer changes segment
```

A simple UPDATE loses the previous value.

## Type 0

Never update the attribute.

Useful when the original value is permanently meaningful.

```text
Original manufacturing country
```

## Type 1

Overwrite the value.

```text
South → West
```

Use when history is not required.

## Type 2

Create a new row for every tracked change.

Example:

```text
vehicle_key | vehicle_id | owner | valid_from | valid_to   | current
101         | V001       | A     | 2025-01-01 | 2026-04-10 | false
205         | V001       | B     | 2026-04-10 | NULL       | true
```

Facts can point to the correct historical dimension key.

## Type 3

Keep current and previous values.

```text
current_region
previous_region
```

Useful when only limited history is needed.

## Type 4

Keep current dimension separately from historical records.

```text
DIM_CUSTOMER
DIM_CUSTOMER_HISTORY
```

## Type 6

Hybrid technique combining characteristics of Types 1, 2 and 3.

## Type 2 Processing

Typical algorithm:

```text
1. Find current dimension row.
2. Compare tracked attributes.
3. If unchanged, do nothing.
4. If changed, expire current row.
5. Insert a new row.
6. Generate new surrogate key.
7. Mark new row current.
```

## SQL Pattern

```sql
UPDATE dim_vehicle
SET
    valid_to = CURRENT_DATE,
    current_flag = FALSE
WHERE vehicle_id = 'V001'
  AND current_flag = TRUE;

INSERT INTO dim_vehicle (
    vehicle_key,
    vehicle_id,
    owner_id,
    valid_from,
    valid_to,
    current_flag
)
VALUES (
    205,
    'V001',
    'C002',
    CURRENT_DATE,
    NULL,
    TRUE
);
```

## Effective-Dated Join

Historical facts can be matched using the event date:

```sql
SELECT f.sale_id, v.vehicle_key
FROM staging_sales f
JOIN dim_vehicle v
  ON f.vehicle_id = v.vehicle_id
 AND f.sale_date >= v.valid_from
 AND (f.sale_date < v.valid_to OR v.valid_to IS NULL);
```

## Late Arriving Facts

A fact may arrive after a dimension change.

The pipeline must define which dimension version applies to the event date.

## Common Mistakes

- overlapping validity periods
- two current rows
- incorrect end dates
- using source ID instead of dimension version key
- updating historical rows accidentally

## Validation

```sql
SELECT vehicle_id, COUNT(*)
FROM dim_vehicle
WHERE current_flag = TRUE
GROUP BY vehicle_id
HAVING COUNT(*) > 1;
```

Also check that validity intervals do not overlap.

## Automobile Example

If a vehicle changes ownership:

```text
Owner A
   ↓
Vehicle V001
   ↓
Owner B
```

a Type 2 dimension can preserve both ownership periods.

## Choosing a Type

Ask:

```text
Do users need historical reports?
Do old facts need old descriptive context?
How much history is needed?
Does the attribute change frequently?
```
