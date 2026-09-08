# Validity

Validity asks whether values conform to expected types, formats, ranges, domains, and business rules.

Examples:

```text
battery_soc: 0..100
speed_kmh: 0..350
latitude: -90..90
longitude: -180..180
status: controlled values
```

SQL:

```sql
SELECT COUNT(*)
FROM telemetry
WHERE speed_kmh < 0 OR speed_kmh > 350;
```

## Business validity

A retired vehicle producing new live events may be syntactically valid but business-invalid.

```sql
SELECT COUNT(*)
FROM telemetry t
JOIN vehicle_master v USING (vehicle_id)
WHERE v.status = 'RETIRED'
  AND t.event_time > v.retirement_date;
```

Validity does not prove accuracy.
