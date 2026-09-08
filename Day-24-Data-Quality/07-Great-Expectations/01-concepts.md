# Great Expectations Concepts

Great Expectations (GX) is an open-source framework for defining and validating expectations about data.

Conceptual components include:

- data sources
- data assets
- batches
- expectations
- expectation suites
- validation
- validation results
- checkpoints

Conceptual flow:

```text
Source -> Asset -> Batch -> Expectations -> Validation -> Results -> Actions
```

Example expectations:

- column is present
- values are not null
- values are unique
- values fall within a range
- row count satisfies a condition

Framework APIs can change between releases, so use the documentation for your installed version.

The important engineering principle is to keep business expectations conceptually independent from the framework used to execute them.
