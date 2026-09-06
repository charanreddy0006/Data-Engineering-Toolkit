# Data Modeling Cheat Sheet

```text
Entity       = business object
Attribute    = property
Relationship = connection
Cardinality  = how many
Grain        = exact row meaning
```

Keys:

```text
PK = primary
FK = foreign
NK = natural/business
SK = surrogate
```

Model levels:

```text
Conceptual -> business
Logical    -> structure
Physical   -> implementation
```

Normalization:

```text
1NF -> atomic/no repeating groups
2NF -> full dependency on composite key
3NF -> no transitive dependency
```

Warehouse:

```text
Fact      -> process/event
Dimension -> context
```

SCD:

```text
0 preserve
1 overwrite
2 version
3 limited previous
```
