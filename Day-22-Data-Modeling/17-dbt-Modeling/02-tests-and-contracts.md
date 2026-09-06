# dbt Tests and Contracts

Common tests:

- unique;
- not_null;
- accepted_values;
- relationships.

Conceptual YAML:

```yaml
columns:
  - name: vehicle_id
    tests:
      - not_null
      - relationships:
          to: ref('dim_vehicle')
          field: vehicle_id
```

## Business tests

Add rules such as:

```text
valid_to > valid_from
one current row per vehicle
distance_km >= 0
```

## Contract fields

Document:

- data type;
- grain;
- nullability;
- accepted values;
- refresh;
- ownership.

The clearer the model, the easier automated testing becomes.
