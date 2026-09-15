# Threat Modeling

## Purpose
Threat modeling identifies assets, actors, entry points, threats, controls, and residual risk before or during design.

## Process

```text
Assets → Actors → Entry Points → Threats → Controls → Residual Risk
```

## Example

Asset: customer-linked telemetry. Threat: unauthorized analyst access. Controls: identity, fine-grained authorization, masking, audit, and review.

## When

Repeat threat modeling after significant architecture, data-flow, identity, or trust-boundary changes.
