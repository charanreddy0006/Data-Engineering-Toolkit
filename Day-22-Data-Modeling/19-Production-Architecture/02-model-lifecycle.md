# Data Model Lifecycle

```text
Requirement
   ↓
Conceptual
   ↓
Logical
   ↓
Physical
   ↓
Implementation
   ↓
Quality
   ↓
Release
   ↓
Monitor
   ↓
Change / Deprecate
```

## Change categories

### Additive

Add a nullable field.

Usually lower risk.

### Behavioral

Change the definition of a metric.

Potentially high risk even if SQL still executes.

### Breaking

Rename, remove, or change the meaning/type of a field.

Requires migration and communication.

## Versioning

Record:

```text
model version
effective date
change reason
downstream impact
migration path
```

## Deprecation

Know the consumers before removing a field.

Published schemas behave like APIs.
