# Lakehouse Modeling

A lakehouse combines flexible lake storage with managed analytical table semantics.

Common logical layers:

```text
Bronze -> Silver -> Gold
```

## Bronze

Preserve source information and ingestion metadata.

## Silver

Standardize:

- identifiers;
- timestamps;
- units;
- types;
- duplicates;
- quality.

## Gold

Publish:

- business metrics;
- dimensional marts;
- aggregates;
- ML features.

## Automobile architecture

```text
Vehicle Gateway
      ↓
Bronze telemetry
      ↓
Silver canonical events
      ↓
Gold fleet metrics
      ↓
BI / ML / APIs
```

Do not treat Bronze as the business semantic layer.
