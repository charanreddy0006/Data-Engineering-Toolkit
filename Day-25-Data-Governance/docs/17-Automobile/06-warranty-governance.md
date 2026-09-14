# Warranty Data Governance

## Purpose
Govern data used to analyze warranty claims and failures.

## Important Concepts

A warranty claim, repair order, part failure, vehicle, dealer, and warranty policy
must have shared definitions.

## Lineage Example

```text
Service System -> Warranty Claims -> Curated Warranty Product
                                      |
                                      +-> Failure Analytics
                                      +-> Supplier Analytics
                                      +-> Finance Reporting
```
