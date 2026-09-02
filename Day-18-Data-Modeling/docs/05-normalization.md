# Normalization


## Purpose

Normalization organizes relational data to reduce redundancy and update
anomalies.

It is especially useful for transactional systems.

## Update Anomaly

Suppose a dealer name appears in 50,000 sales rows.

Changing the dealer name requires updating many rows.

If only some rows are changed, the database contains inconsistent values.

## Insert Anomaly

If a table requires a sale before a new vehicle model can be recorded, the
design may prevent storing valid model information independently.

## Delete Anomaly

Deleting the last sale of a model should not accidentally delete the model
definition.

## 1NF

First Normal Form focuses on atomic values and repeating groups.

Bad:

```text
vehicle_id | features
V001       | ABS,ADAS,Sunroof
```

Better:

```text
vehicle_feature
vehicle_id
feature_id
```

## 2NF

Second Normal Form applies to relations with composite keys.

Every non-key attribute should depend on the entire key.

Example:

```text
(order_id, product_id, product_name)
```

`product_name` depends only on `product_id`, so it does not belong in this
relationship table.

## 3NF

Third Normal Form removes inappropriate transitive dependencies.

Bad:

```text
vehicle_id
dealer_id
dealer_name
dealer_region
```

If:

```text
vehicle_id → dealer_id
dealer_id → dealer_name, dealer_region
```

then dealer attributes belong in DEALER.

## Normalized Automobile Model

```text
CUSTOMER
customer_id
name

MODEL
model_id
model_name
manufacturer

VEHICLE
vehicle_id
customer_id
model_id
vin

DEALER
dealer_id
dealer_name
region

SALE
sale_id
vehicle_id
dealer_id
sale_date
amount
```

## Benefits

- reduced redundancy
- stronger consistency
- easier updates
- clear ownership
- cleaner transactional logic

## Costs

Normalization can increase joins.

For OLTP this is often acceptable because transactions usually touch a limited
number of records.

For analytics, repeated joins across very large tables may not be ideal.

## BCNF

Boyce-Codd Normal Form is stricter than 3NF and addresses certain dependency
situations where every determinant should be a candidate key.

You do not need to force every warehouse table into BCNF.

## Normalization Decision

Ask:

```text
What workload?
What is the source of truth?
How frequently does data change?
How many joins are acceptable?
Who consumes the data?
```

## Practical Exercise

Start with:

```text
sale_id
customer_name
customer_phone
vehicle_vin
model_name
dealer_name
dealer_region
sale_amount
```

Normalize it into separate entities and identify every foreign key.
