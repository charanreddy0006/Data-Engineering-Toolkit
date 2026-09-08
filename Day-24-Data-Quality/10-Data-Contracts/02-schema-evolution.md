# Schema Evolution and Quality

Schema changes can create quality incidents even when jobs remain green.

Usually safer:

- adding an optional field
- adding documented metadata

Riskier:

- renaming fields
- changing types
- changing units
- changing semantics
- removing fields
- changing nullability

Example:

```text
battery_soc = percentage 0..100
```

silently becoming:

```text
battery_soc = fraction 0..1
```

is dangerous if the field name remains unchanged.

Contracts should specify units, scale, timezone, semantic definition, and compatibility policy.
