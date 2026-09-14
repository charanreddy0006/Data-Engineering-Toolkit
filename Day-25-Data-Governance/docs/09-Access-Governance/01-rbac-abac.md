# RBAC and ABAC

## Purpose
Compare role-based and attribute-based access control.

## RBAC

Access is granted through roles.

Example:

`Telemetry Analyst -> role -> read curated telemetry`

RBAC is simple and understandable but can become role-heavy in large organizations.

## ABAC

Access is evaluated using attributes such as user department, dataset classification,
purpose, environment, geography, or device trust.

Conceptually:

`Allow if user.department = fleet AND dataset.class = INTERNAL`

## Hybrid

Many organizations combine RBAC with contextual/attribute controls.
