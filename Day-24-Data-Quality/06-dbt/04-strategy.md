# dbt Quality Strategy

dbt is useful for quality checks around warehouse transformations.

Common built-in tests include:

- not_null
- unique
- relationships
- accepted_values

Custom SQL tests can express domain-specific rules.

Recommended layering:

```text
raw -> source freshness
       |
staging -> type/standardization
       |
intermediate -> business rules
       |
facts/dimensions -> uniqueness/references
       |
marts -> consumer-level reconciliation
```

Run fast critical tests in CI and broader tests in scheduled production jobs.

Test names and failure messages should be understandable to the engineers operating the pipeline.
