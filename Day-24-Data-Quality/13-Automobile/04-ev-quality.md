# EV Data Quality

Important EV fields:

- state of charge
- state of health
- battery temperature
- charging power
- charger status
- charging session ID
- energy delivered

Basic domains:

```text
SOC: 0..100
SOH: 0..100
energy_kwh: >= 0
charging_power_kw: >= 0
```

Cross-field checks need context. If a charger is not charging, power should normally be zero or near zero, but balancing and device behavior can create legitimate edge cases.

Automotive quality rules should understand physical and business context.
