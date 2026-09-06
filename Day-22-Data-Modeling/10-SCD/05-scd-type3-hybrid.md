# SCD Type 3 and Hybrid History

## Type 3

Stores limited history:

```text
current_dealer
previous_dealer
```

It answers a narrow question:

> What is current and what was immediately previous?

It does not preserve an unlimited timeline.

## Hybrid strategy

Different attributes can have different behavior.

| Attribute | History | Strategy |
|---|---:|---|
| Corrected model name | No | Type 1 |
| Exterior color | Yes | Type 2 |
| VIN | Immutable | Type 0 |
| Dealer | Yes | Type 2 |
| Derived label | Current | Type 1 |

## Key lesson

SCD is an attribute-level business decision, not a single setting applied blindly to every column.
