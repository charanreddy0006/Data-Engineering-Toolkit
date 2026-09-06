# Slowly Changing Dimensions

SCD handles dimension attribute changes over time.

Example:

```text
Vehicle color:
White -> Blue
```

Question:

> Should historical analytics show the current value or the value that was true when the event
> occurred?

## Type 0

Never change the value.

## Type 1

Overwrite the value.

## Type 2

Create a new historical version.

## Type 3

Keep limited history, such as current and previous.

## Decision

```text
Does historical truth matter?
       │
   ┌───┴───┐
  yes      no
   │        │
 Type 2   Type 0/1
```

Different attributes may use different strategies.

## Automobile example

A corrected model spelling may be Type 1.

Vehicle ownership or dealer assignment often requires Type 2 when historical reporting matters.
