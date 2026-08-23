# 04 — Problems Solved by Data Lakes

## 1. Data Silos

Different teams may store information in isolated systems.

A lake can provide a centralized analytical storage layer.

## 2. Data Variety

A lake can store structured tables together with JSON, logs, documents,
and sensor data.

## 3. Historical Retention

Raw events can be retained for future analysis and reprocessing.

## 4. Large Scale

Object storage can scale far beyond a single local disk.

## 5. Multiple Consumers

The same underlying data can support:

```text
BI
ML
Analytics
Data Science
Applications
Research
```

## 6. Batch and Streaming

A modern platform can accept both historical files and continuous events.

## Automobile Example

```text
Vehicle
  |
  +--> Diagnostics
  +--> GPS
  +--> Battery
  +--> Speed
  +--> Temperature
          |
          v
      Data Lake
```

The company can later analyze vehicle health, warranty behavior, energy
consumption, and maintenance patterns.
