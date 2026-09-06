# Role-Playing Date Dimensions

One date dimension can serve multiple roles.

Service fact:

```text
opened_date_key
diagnosed_date_key
closed_date_key
```

All point to `dim_date`.

## Query

```sql
SELECT
    open_date.year,
    close_date.year,
    COUNT(*) AS orders
FROM fact_service f
JOIN dim_date open_date
  ON open_date.date_key = f.opened_date_key
JOIN dim_date close_date
  ON close_date.date_key = f.closed_date_key
GROUP BY open_date.year, close_date.year;
```

## Why explicit roles?

They prevent semantic ambiguity.

Use:

```text
opened_date_key
```

instead of:

```text
date_key_1
```

Good naming is part of modeling quality.
