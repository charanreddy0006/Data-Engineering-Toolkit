# Automobile ERD

```mermaid
erDiagram
    CUSTOMER ||--o{ VEHICLE : owns
    VEHICLE }o--|| VEHICLE_MODEL : is
    MANUFACTURER ||--o{ VEHICLE_MODEL : produces
    DEALER ||--o{ SALE : records
    VEHICLE ||--o{ SALE : sold
    CUSTOMER ||--o{ SALE : purchases
    VEHICLE ||--o{ SERVICE_ORDER : receives
    DEALER ||--o{ SERVICE_ORDER : performs
    VEHICLE ||--o{ TELEMETRY_EVENT : emits

    CUSTOMER {
        bigint customer_id PK
        string name
        string email
    }

    VEHICLE {
        bigint vehicle_id PK
        bigint customer_id FK
        bigint model_id FK
        string vin
    }

    VEHICLE_MODEL {
        bigint model_id PK
        bigint manufacturer_id FK
        string model_name
        string fuel_type
    }

    MANUFACTURER {
        bigint manufacturer_id PK
        string manufacturer_name
    }

    DEALER {
        bigint dealer_id PK
        string dealer_name
        string region
    }

    SALE {
        bigint sale_id PK
        bigint vehicle_id FK
        bigint dealer_id FK
        date sale_date
        decimal amount
    }

    SERVICE_ORDER {
        bigint service_order_id PK
        bigint vehicle_id FK
        bigint dealer_id FK
        date service_date
        decimal total_cost
    }

    TELEMETRY_EVENT {
        string event_id PK
        bigint vehicle_id FK
        datetime event_time
        decimal speed
        decimal battery_level
    }
```

## Modeling Observation

The ER model represents operational relationships.

The warehouse model should not simply copy this ERD. It should be redesigned
around analytical business processes and grains.
