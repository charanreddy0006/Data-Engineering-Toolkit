# Diagnostic Code Quality

Diagnostic events should have:

- known code
- valid severity
- valid timestamp
- valid vehicle reference
- consistent definition

A reference table can contain:

```text
diagnostic_code
description
severity
system
active_from
active_to
```

Historical effective dates matter. A code can exist today without having been valid during an older time period.

Reference-data quality is therefore part of domain quality.
