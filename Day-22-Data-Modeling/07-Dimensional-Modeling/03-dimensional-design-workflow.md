# Dimensional Design Workflow

## Step 1 — Select business process

Example:

```text
Vehicle Service
```

## Step 2 — Declare grain

```text
One row per service order line.
```

## Step 3 — Identify dimensions

```text
Date
Vehicle
Customer
Dealer
Part
```

## Step 4 — Identify measures

```text
quantity
unit_price
labor_hours
cost
```

## Step 5 — Identify history

Should dealer/customer/model attributes be historical?

## Step 6 — Classify additivity

Can the measure be safely summed across time and dimensions?

## Step 7 — Handle many-to-many

Use bridges and explicit allocation when required.

## Step 8 — Define quality

```text
unique line
valid vehicle key
non-negative quantity
```

## Step 9 — Reconcile

Compare results with a trusted business report.

A model is complete only when its business results are understood and validated.
