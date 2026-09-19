# Security Design

## Data Classes

### Internal
Aggregated operational features.

### Sensitive
- precise vehicle location
- customer-linked data
- driver behavior

## Controls

- least privilege
- authenticated service accounts
- encrypted transport
- secrets in a managed secret system
- audited access
- environment separation

## Serving

Only the inference service should read the production online feature set required by its model.

## Training

Model-development users receive access only to approved datasets and features.
