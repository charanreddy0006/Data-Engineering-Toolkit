# 22. Feature Store Security

## Security Areas

- identity
- authentication
- authorization
- network security
- encryption
- secret management
- audit logging

## Least Privilege

A training job should receive only the feature datasets it needs.

An online application should not automatically receive unrestricted access to the entire feature catalog.

## Sensitive Automobile Data

Potentially sensitive domains include:
- precise location
- customer-linked information
- vehicle identifiers
- driver behavior
- service history

Access depends on business and legal requirements.

## Controls

- role-based permissions
- environment separation
- row/feature-level restrictions where supported
- encrypted connections
- audit trails
- secret rotation

## Important

Security must be designed into the pipeline and serving path rather than added at the end.
