# 18 — Docker in Automobile Data Engineering 🚗

## Automotive Data Sources

A modern automotive organization can receive data from:

- connected vehicles
- ECUs
- diagnostics
- manufacturing plants
- dealers
- service centers
- warranty systems
- EV chargers
- mobile applications
- navigation systems

## Connected Vehicle Architecture

```mermaid
flowchart LR
    V[Connected Vehicle] --> G[Telemetry Gateway]
    G --> I[Ingestion]
    I --> K[Kafka]
    K --> P[Stream Processing]
    P --> L[Lake / Warehouse]
    L --> BI[Analytics]
```

## Telemetry

```json
{
  "vehicle_id": "VH1001",
  "event_time": "2026-09-03T10:15:00Z",
  "speed_kmh": 72,
  "battery_soc": 81.5,
  "engine_temp_c": 91.2
}
```

## Docker Role

Docker can package:

```text
Python ingestion
Quality service
Processing application
Development database
```

## Service Data

```text
Dealer CSV
 ↓
ETL container
 ↓
Validation
 ↓
Database
```

## EV Charging

```text
Vehicle
 ↓
Charging Session
 ↓
Energy Consumed
 ↓
Analytics
```

## Manufacturing

```text
Plant Sensors
 ↓
Gateway
 ↓
Streaming
 ↓
Storage
 ↓
Quality
 ↓
Manufacturing KPI
```

## Local Learning Architecture

```text
Telemetry CSV
 ↓
Python Container
 ↓
PostgreSQL
 ↓
Quality Container
 ↓
SQL Analytics
```

## Production Evolution

```text
Local Compose
 ↓
Cloud container platform
 ↓
Managed database
 ↓
Managed streaming
 ↓
Object storage
 ↓
Lakehouse / Warehouse
```

Docker is one layer of the overall architecture.
