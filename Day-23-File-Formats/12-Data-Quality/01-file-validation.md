# File Validation

A file parser succeeding is not the same as data being valid.

## Layer 1 — File integrity

Check:

```text
exists
readable
expected extension/type
non-zero size
complete upload
```

## Layer 2 — Schema

Check:

```text
required columns
types
schema version
```

## Layer 3 — Records

Check:

```text
required IDs
ranges
timestamps
duplicate IDs
```

## Layer 4 — Dataset

Check:

```text
row count
freshness
partition completeness
distribution
```

## Automobile quality

```text
battery_soc between 0 and 100
speed_kph >= 0
odometer_km >= 0
event_id unique
vehicle_id known or controlled unknown
```

## Publish decision

```text
validate
  ├── pass -> publish
  └── fail -> quarantine / fail pipeline
```

Do not silently discard bad records without recording what happened.
