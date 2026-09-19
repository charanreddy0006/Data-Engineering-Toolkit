# 8. Feature Registry

## Purpose

A registry or catalog makes features discoverable and documented.

## Useful Metadata

```text
Feature Name
Description
Entity
Data Type
Source
Transformation
Owner
Tags
Freshness
Version
Status
```

## Example

```yaml
name: harsh_braking_count_24h
entity: vehicle
dtype: int64
source: telemetry_events
freshness: hourly
owner: connected_vehicle_team
status: production
```

## Why It Matters

Without metadata, a feature named `avg_speed` could mean:
- average speed over a trip
- average speed per day
- average speed over 7 days
- average speed only while moving

Names alone are not enough.

## Governance

Use review and approval processes for high-impact production features.
