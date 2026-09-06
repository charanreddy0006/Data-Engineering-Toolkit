# Normalized vs Denormalized

Normalized:

```text
less redundancy
stronger update consistency
more joins
```

Denormalized:

```text
more redundancy
simpler/faster reads in some workloads
more refresh responsibility
```

Choose based on workload.

The right question is not "Which is universally better?"

It is:

> Which design best satisfies correctness, query patterns, scale, and maintainability?
