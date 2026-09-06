# Streaming Schema Contracts

A streaming event is a contract between producers and consumers.

Example contract:

```text
event_id       required string
vehicle_id     required string
event_time     required timestamp
speed_kph      optional number
battery_soc    optional number
schema_version required integer
```

## Compatibility

An additive optional field is usually easier to support.

Changing units without changing field name is dangerous:

```text
speed_kph
```

must not suddenly mean mph.

## Governance

Track:

- schema owner;
- version;
- compatibility rule;
- producer;
- consumers;
- migration deadline.

A schema contract protects data consumers from silent semantic changes.
