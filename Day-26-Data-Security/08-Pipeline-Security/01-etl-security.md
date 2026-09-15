# ETL and ELT Security

## Purpose
Secure source connections, pipeline identities, transport, input validation, output permissions, logging, and secrets.

## Pattern

`Source → Authenticated Ingestion → Validated Data → Authorized Storage → Audited Product`

## Least privilege

Scope pipeline identities to their required resources.
