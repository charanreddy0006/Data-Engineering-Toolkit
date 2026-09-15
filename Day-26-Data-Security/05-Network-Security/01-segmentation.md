# Network Segmentation

## Purpose
Separate public entry, applications, processing, and data storage zones.

## Pattern

```text
Internet → Gateway → Application → Processing → Data Storage
```

## Goal

A compromised component should not automatically have unrestricted connectivity to every data system.
