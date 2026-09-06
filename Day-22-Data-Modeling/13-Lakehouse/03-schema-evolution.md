# Schema Evolution

Source schemas change.

A producer may add:

```json
"battery_temperature_c": 31.4
```

An additive optional field is often easier to support than a breaking semantic change.

## Breaking examples

- rename a required field;
- remove a required field;
- change units;
- change identifier meaning;
- change a numeric field to incompatible text.

## Compatibility policy

Document:

```text
compatible
breaking
migration required
deprecation period
```

## Automobile rule

Different vehicle models may support different sensors.

The canonical layer should absorb source diversity and expose a stable downstream contract.

## Versioning

Use explicit schema versions when appropriate:

```text
schema_version = 3
```
