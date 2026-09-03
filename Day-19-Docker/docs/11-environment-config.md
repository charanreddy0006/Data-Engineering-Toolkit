# 11 — Environment Variables and Configuration

## Goal

One image should work in:

```text
Development
Staging
Production
```

without rebuilding simply because infrastructure addresses differ.

## Example

```yaml
environment:
  DB_HOST: ${DB_HOST}
  DB_PORT: ${DB_PORT}
  DB_NAME: ${DB_NAME}
```

## .env

```env
DB_HOST=postgres
DB_PORT=5432
DB_NAME=automotive
```

Never commit production secrets.

## Configuration

Examples:

- hostname
- port
- environment
- batch size
- log level
- feature flags

## Secrets

Examples:

- passwords
- API keys
- tokens
- private credentials

Secrets should use appropriate secret-management facilities in production.

## Bad

```dockerfile
ENV DB_PASSWORD=production-password
```

This is not a secure secret-management design.

## Automobile Example

```text
Development → postgres
Staging     → staging-db
Production  → managed-production-db
```

The same image can be promoted between environments.

## Twelve-Factor Thinking

Keep environment-specific configuration outside the application artifact where practical.
