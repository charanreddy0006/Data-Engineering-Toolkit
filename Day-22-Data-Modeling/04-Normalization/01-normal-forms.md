# Normal Forms

Normalization reduces redundancy and update anomalies.

## First Normal Form

Avoid repeating groups and non-atomic lists.

Bad:

```text
service_order_id | parts
10               | BRAKE,OIL,FILTER
```

Better:

```text
service_order_part
10 | BRAKE
10 | OIL
10 | FILTER
```

## Second Normal Form

With a composite key, every non-key attribute should depend on the whole key.

If:

```text
(order_id, part_id)
```

is the key, `part_name` depends on `part_id`, not on the whole pair. It belongs in `part`.

## Third Normal Form

Avoid non-key attributes depending on other non-key attributes.

Bad:

```text
service_order(order_id, dealer_id, dealer_name)
```

if dealer_name is determined by dealer_id.

Better:

```text
dealer(dealer_id, dealer_name)
service_order(order_id, dealer_id)
```

## Automobile OLTP

A normalized operational model might separate:

```text
manufacturer
vehicle_model
vehicle
dealer
service_order
service_order_part
part
```

## Important

Normalization is a design tool, not a competition.

Analytical models often denormalize intentionally.
