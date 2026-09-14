# What Is Data Governance?

## Purpose
Build a strong foundation before learning tools.

## Simple Definition

Data governance is the system an organization uses to make decisions about data and
to assign accountability for those decisions.

A useful formula is:

`Governance = Accountability + Policies + Standards + Controls + Evidence`

Governance does not mean stopping people from using data. Good governance makes the
right data easier to find and use while reducing unnecessary risk.

## Why It Exists

Without governance, the same metric can have multiple definitions, nobody may know
who owns a dataset, sensitive data may be copied without controls, and pipeline changes
can break downstream consumers silently.

## Typical Questions

- What does this field mean?
- Which source is authoritative?
- Who owns it?
- Who may access it?
- How long should it exist?
- What quality standard applies?
- What changed and who approved it?

## Automobile Example 🚗

A manufacturer has vehicle telemetry from millions of vehicles. Governance defines
the meaning of `event_time`, the authority for `vehicle_id`, access rules for
location-linked data, retention requirements, and ownership of the telemetry domain.
