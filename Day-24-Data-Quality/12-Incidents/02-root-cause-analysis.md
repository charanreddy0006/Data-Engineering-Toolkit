# Root Cause Analysis

Do not stop at "the data was wrong."

## Five Whys example

```text
Invalid SOC values
    |
firmware changed SOC scale
    |
contract did not define scale clearly
    |
producer and consumer assumptions differed
    |
no compatibility test blocked release
```

Potential root-cause categories:

- source defect
- schema change
- transformation bug
- infrastructure failure
- configuration error
- reference-data problem
- late data
- duplicate delivery
- process failure

Preventive controls include contracts, producer tests, unit metadata, compatibility gates, and better observability.
