# Database Partitioning

## 1. Introduction

Partitioning divides a large database table or dataset into smaller logical pieces called partitions.

Instead of treating a huge table as one unit:

```text
Large Table
```

it can be divided:

```text
Large Table
   |
   +-- Partition 1
   +-- Partition 2
   +-- Partition 3
   +-- Partition 4
```

Partitioning can improve query performance and data management for suitable workloads.

## 2. Why Partition Data?

Partitioning can help with:

- Large tables
- Query performance
- Data lifecycle management
- Maintenance
- Parallel processing

## 3. Range Partitioning

Data is divided according to ranges.

Example:

```text
vehicle_sensor_data

2024 → Partition 1
2025 → Partition 2
2026 → Partition 3
```

A timestamp column is commonly used.

## 4. Automobile Example

Suppose a vehicle platform collects billions of sensor records.

```text
timestamp
vehicle_id
speed
battery
temperature
```

Partition by year:

```text
2024
2025
2026
```

A query for 2026 data may only need to access the relevant partition when the database can perform partition pruning.

## 5. List Partitioning

Data is divided based on specific values.

Example:

```text
Region

Gujarat  → Partition 1
Maharashtra → Partition 2
Delhi → Partition 3
```

Conceptually:

```text
Sales
 |
 +-- Gujarat
 +-- Maharashtra
 +-- Delhi
```

## 6. Hash Partitioning

A hash function determines the partition.

```text
vehicle_id
    |
    v
Hash Function
    |
    +--> Partition 1
    +--> Partition 2
    +--> Partition 3
```

This can distribute data across partitions.

## 7. Partition Pruning

Suppose:

```sql
SELECT *
FROM vehicle_sensor_data
WHERE timestamp >= '2026-01-01'
AND timestamp < '2027-01-01';
```

If the table is partitioned by date, the database may only scan the relevant partitions.

Conceptually:

```text
All Partitions
     |
     v
Relevant Partition
     |
     v
Query
```

## 8. Partitioning vs Indexing

They solve different problems.

```text
Partitioning
→ Divides large data into pieces

Indexing
→ Provides structures for locating rows efficiently
```

They can be used together.

## 9. Partition Management

Large systems may create partitions periodically.

Example:

```text
vehicle_data_2026_01
vehicle_data_2026_02
vehicle_data_2026_03
```

Older partitions may be archived or removed according to retention policies.

## 10. Data Engineering Pipeline

```text
Raw Sensor Data
      |
      v
Partition by Date
      |
      +---- 2026-01
      +---- 2026-02
      +---- 2026-03
      |
      v
Analytics
```

Partitioning can also be important in data lakes and distributed processing systems.

## 11. Partition Key

A partition key determines how data is divided.

Good partition keys generally provide:

- Useful query filtering
- Reasonable data distribution
- Manageable partition sizes

Choosing a poor partition key can create unbalanced partitions.

## 12. Partition Skew

Suppose most vehicle data belongs to one region:

```text
Gujarat       → 90%
Other regions → 10%
```

Partitioning by region could create an overloaded partition.

This is called skew.

## 13. Advantages

- Can improve query performance
- Easier lifecycle management
- Can reduce scanned data
- Useful for large datasets
- Supports parallel processing in suitable systems

## 14. Limitations

- Additional design complexity
- Poor partition keys can hurt performance
- Too many partitions can create management overhead
- Not every query benefits from partitioning

## Best Practices

- Choose partition keys based on workload.
- Avoid extremely small partitions.
- Monitor partition sizes.
- Watch for skew.
- Use partition pruning where possible.
- Combine partitioning with appropriate indexing when useful.

## Interview Questions

1. What is database partitioning?
2. Why is partitioning used?
3. What is range partitioning?
4. What is list partitioning?
5. What is hash partitioning?
6. What is partition pruning?
7. Partitioning vs indexing?
8. What is partition skew?
9. How would you partition vehicle sensor data?

## Summary

Partitioning divides large datasets into manageable pieces and can improve performance and data lifecycle management when designed around actual workload patterns.
```