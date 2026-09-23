# 28. Security

## Principles

- least privilege
- secure credentials
- encryption in transit
- encryption at rest
- audit logging
- environment separation

## Secrets

Never hard-code passwords in:
- source code
- Git
- public YAML

Use a suitable secret-management system.

## Automobile

Customer-linked service data and precise vehicle location may need stricter access controls than aggregated fleet statistics.
