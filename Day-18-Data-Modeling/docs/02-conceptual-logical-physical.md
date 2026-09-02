# Conceptual, Logical and Physical Models


## Conceptual Model

The conceptual model is the business view.

Example:

```text
Customer
   |
 owns
   |
 Vehicle
   |
 receives
   |
Service
```

At this stage, avoid implementation details such as VARCHAR or indexes.

## Logical Model

The logical model turns business concepts into structured entities.

```text
CUSTOMER
customer_id
name
email

VEHICLE
vehicle_id
customer_id
vin
model_id

MODEL
model_id
model_name
manufacturer
```

Relationships:

```text
CUSTOMER 1 → N VEHICLE
MODEL    1 → N VEHICLE
VEHICLE  1 → N SERVICE
```

## Physical Model

The physical model answers:

- Which database?
- Which data type?
- Which indexes?
- Which constraints?
- Which partition?
- Which clustering key?
- Which storage format?

Example:

```sql
CREATE TABLE vehicle (
    vehicle_id BIGINT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    vin VARCHAR(17) NOT NULL UNIQUE,
    model_id BIGINT NOT NULL,
    manufacture_year SMALLINT,
    CONSTRAINT fk_vehicle_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
);
```

## Why the Separation Matters

Suppose the business says:

> A vehicle belongs to a customer.

The conceptual statement does not change if the company moves from PostgreSQL
to Snowflake.

Logical representation:

```text
vehicle.customer_id → customer.customer_id
```

Physical implementation changes with the platform.

## Conceptual Example

```text
Customer
Vehicle
Dealer
Sale
Service
```

## Logical Example

```text
Customer(customer_id, name)
Vehicle(vehicle_id, customer_id, vin)
Dealer(dealer_id, name)
Sale(sale_id, vehicle_id, dealer_id, sale_date, amount)
```

## Physical Example

```text
BIGINT
VARCHAR(17)
DATE
DECIMAL(18,2)
PRIMARY KEY
FOREIGN KEY
INDEX
PARTITION
```

## Design Review

A useful review asks:

```text
Conceptual:
Did we model the right business objects?

Logical:
Did we model their relationships correctly?

Physical:
Will the implementation support the workload?
```

## Common Mistake

Jumping from a business requirement directly to SQL often causes accidental
technical decisions to become business rules.

Example:

```text
"We need vehicle history."
```

A developer immediately creates:

```text
vehicle.updated_at
```

But that only records the latest update. It does not necessarily preserve
historical versions.

The logical requirement should first be clarified:

```text
Do we need current state?
Full history?
Change events?
Effective dates?
Audit history?
```

## Practical Exercise

Create all three models for:

```text
Customer
Vehicle
Dealer
Vehicle Sale
```

Keep the conceptual model simple, the logical model precise, and the physical
model platform-aware.
