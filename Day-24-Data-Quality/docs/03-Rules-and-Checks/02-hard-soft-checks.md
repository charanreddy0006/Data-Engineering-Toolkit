# Hard and Soft Quality Checks

## Hard

Failure blocks or quarantines data.

Use for:

- invalid schema
- missing primary identity
- security classification
- impossible business states

## Soft

Failure generates a warning while processing can continue.

Use for:

- optional fields
- low-impact anomalies
- small changes in distributions

## Example policy

```text
Critical -> stop publication
High     -> quarantine affected rows/partition
Medium   -> publish + warning
Low      -> record metric
```

Avoid stopping a 10-million-row telemetry batch because three optional records are malformed unless the business requirement says to do so.

Quality gates should be risk-based.
