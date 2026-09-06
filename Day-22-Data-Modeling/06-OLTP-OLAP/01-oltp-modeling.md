# OLTP Modeling

OLTP supports operational workflows.

Automobile examples:

- vehicle registration;
- service booking;
- parts inventory;
- warranty claim creation.

## Characteristics

- frequent writes;
- short transactions;
- concurrency;
- strong consistency;
- normalized structures;
- selective indexes.

Example transaction:

```sql
BEGIN;

INSERT INTO service_order (...);

UPDATE vehicle
SET service_status = 'IN_SERVICE'
WHERE vehicle_id = 1001;

COMMIT;
```

## OLTP priorities

1. correctness;
2. integrity;
3. concurrency;
4. transaction performance;
5. predictable point lookup.

## Anti-pattern

Do not continuously add analytical fields to the operational vehicle row:

```text
last_30_day_distance
monthly_energy
fault_rate
avg_trip_speed
```

unless the operational application genuinely requires them.

Those are usually analytical derivatives.
