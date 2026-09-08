# Designing Good Rules

## Be deterministic

Prefer:

```text
battery_soc between 0 and 100
```

over:

```text
battery_soc should look normal
```

## Be actionable

A failure should identify:

- rule
- partition
- source
- sample values
- owner

## Avoid over-validation

Do not encode assumptions that ignore legitimate business behavior.

## Prefer semantics

Document units, timezone, scale, and meaning.

For example:

```text
battery_soc = percentage 0..100
```

is safer than merely documenting `battery_soc = number`.

## Version rules

Quality policy changes. Preserve versions so historical results remain interpretable.
