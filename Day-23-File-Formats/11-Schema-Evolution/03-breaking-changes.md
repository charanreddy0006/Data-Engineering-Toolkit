# Breaking Schema Changes

A breaking change can invalidate downstream readers or change business meaning.

## Examples

```text
remove vehicle_id
rename battery_soc
change integer ID to incompatible structure
change speed_kph from km/h to mph
```

The last example is especially dangerous because the physical type can remain `double` while
the business meaning changes.

## Safe migration

```text
proposal
   ↓
impact analysis
   ↓
compatibility test
   ↓
version
   ↓
dual-read / migration period
   ↓
consumer migration
   ↓
deprecation
```

## Automobile example

If v1 contains:

```text
speed_kph
```

and a producer wants mph, do not simply change the unit.

Safer choices include:

```text
speed_kph
speed_mph
```

during a migration, or a versioned contract with explicit semantics.

## Checklist

- [ ] producers identified
- [ ] consumers identified
- [ ] dashboards identified
- [ ] tests updated
- [ ] migration documented
- [ ] old version deprecation date defined
