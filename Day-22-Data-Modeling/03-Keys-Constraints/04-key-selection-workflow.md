# Key Selection Workflow

## 1. Identify business identity

What does the business use to identify the entity?

Example:

```text
VIN
```

## 2. Test uniqueness

```sql
SELECT vin, COUNT(*)
FROM vehicle
GROUP BY vin
HAVING COUNT(*) > 1;
```

## 3. Test stability

Can the identifier change?

## 4. Choose physical key

For an analytical dimension:

```text
surrogate key + business key
```

## 5. Enforce uniqueness

If the business rule is true:

```sql
UNIQUE (vin)
```

## 6. Document exceptions

Legacy source data may contain duplicates. Never silently discard them.

Instead document:

```text
source issue
reconciliation rule
surviving record
audit trail
```
