# Compose Patterns

## PostgreSQL

```bash
docker compose -f 01-postgres.yaml up
```

## ETL + PostgreSQL

```bash
docker compose -f 02-etl-postgres.yaml up --build
```

## Optional Tools

```bash
docker compose   -f 03-profile-tools.yaml   --profile tools   up
```

Profiles are useful for development-only services.

Credentials in these examples are for local learning only.
