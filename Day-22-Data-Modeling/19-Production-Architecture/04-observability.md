# Model Observability

A successful pipeline run does not prove that the data is correct.

Monitor:

## Freshness

When did the latest valid data arrive?

## Volume

Did today's row count change unexpectedly?

## Distribution

Did battery SOC suddenly become zero for most vehicles?

## Uniqueness

Did duplicate event IDs appear?

## Referential integrity

Did trips arrive without known vehicles?

## Example

```text
Model                 Freshness   Quality
fact_trip             08:05       PASS
fact_service          07:55       PASS
telemetry_silver      08:10       WARN
dim_vehicle           08:00       PASS
```

Observability should detect semantic failures as well as infrastructure failures.
