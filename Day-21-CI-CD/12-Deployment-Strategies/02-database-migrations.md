# Database Migrations in CI/CD

A dangerous deployment assumes the new schema exists before it is created.

## Expand/contract

```text
Expand
 ↓
Migrate
 ↓
Deploy compatible application
 ↓
Switch
 ↓
Contract
```

Example:

1. Add a nullable field.
2. Deploy code that supports old and new.
3. Backfill.
4. Switch reads/writes.
5. Remove old field later.

## Why?

It reduces coupling between application deployment and schema change.

## Data engineering

The same principle applies to:

- warehouse schemas,
- event schemas,
- data contracts,
- ETL outputs.
