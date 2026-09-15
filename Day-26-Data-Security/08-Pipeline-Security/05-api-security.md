# API Security

## Purpose
Data APIs require authentication, authorization, input validation, TLS, rate limits, output minimization, and logging.

## Design

Expose an approved projection rather than an unrestricted database table.

## Errors

Avoid leaking sensitive schema, credentials, or internal infrastructure details through errors.
