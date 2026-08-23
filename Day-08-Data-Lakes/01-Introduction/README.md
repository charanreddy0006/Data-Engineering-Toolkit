# 01 — Introduction to Data Lakes

## What is a Data Lake?

A data lake is a scalable data storage architecture designed to hold large
amounts of structured, semi-structured, and unstructured data.

Unlike a traditional warehouse, data does not always need to be transformed
into a fixed relational model before it is stored.

## Schema-on-Read

A common data-lake principle is schema-on-read.

```text
Raw Data
   |
   | stored first
   v
Data Lake
   |
   | schema applied when needed
   v
Analytics / ML
```

## Supported Data

- CSV
- JSON
- XML
- Parquet
- Avro
- ORC
- Images
- Audio
- Video
- Logs
- Sensor events

## Why It Matters

Modern organizations generate data from applications, websites, devices,
vehicles, machines, databases, APIs, and business systems. A data lake provides
a central scalable location for this information.

## Important Warning

A data lake is not simply a folder containing random files. Without metadata,
quality, security, ownership, and lifecycle management, it can become a
data swamp.

## Example

A vehicle manufacturer can store:

```text
vehicle_id
timestamp
speed
battery_level
temperature
gps_latitude
gps_longitude
diagnostic_code
```

The same platform can later support analytics, dashboards, and machine learning.
