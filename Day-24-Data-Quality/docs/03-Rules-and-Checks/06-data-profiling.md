# Data Profiling

Profiling describes observed data before formal expectations are established.

Profile:

- data type
- null count
- distinct count
- min/max
- percentiles
- category frequency
- distributions

Example baseline:

```text
null rate today = 0.2%
historical avg  = 0.3%
```

Likely normal.

But:

```text
null rate today = 18%
historical avg  = 0.3%
```

is a strong signal.

Profiling is descriptive. Validation compares observed data to explicit expectations.
