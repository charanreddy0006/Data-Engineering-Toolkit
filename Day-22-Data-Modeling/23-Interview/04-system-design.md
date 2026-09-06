# System Design — Connected Vehicle Platform

## Requirement

Millions of vehicles produce telemetry while service and warranty systems produce transactional
data.

## Architecture

```text
Vehicles / Dealers / Warranty / Manufacturing
                  ↓
              Ingestion
                  ↓
            Raw / Bronze
                  ↓
         Canonical / Silver
                  ↓
       Facts + Dimensions
                  ↓
          Gold / Marts
             ↙      ↘
           BI       ML
```

## Models

Telemetry:

> one row per event.

Trip:

> one row per completed trip.

Service:

> one row per service order/line depending on fact.

Vehicle:

> conformed dimension.

Ownership:

> historical relationship.

Vehicle-day:

> periodic snapshot.

## Risks

- duplicates;
- late events;
- clock skew;
- schema evolution;
- ID reconciliation;
- fan-out joins;
- inconsistent metric definitions.

## Strong answer

Explain not just the tables but why each grain, key, history strategy, and quality rule exists.
