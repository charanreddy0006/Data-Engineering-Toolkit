# Parquet vs ORC

Both are columnar analytical formats.

Compare:

```text
engine compatibility
storage size
query runtime
bytes scanned
CPU
memory
tooling
```

## Avoid unsupported claims

There is no universal rule that one always wins.

A fair benchmark uses:

```text
same dataset
same schema
same partitioning
same compression intent
same engine
same queries
```

## Automobile decision

If the existing platform is strongly Hive/ORC-oriented, ORC may be sensible.

If broad modern interoperability is the priority and the ecosystem is already Parquet-oriented,
Parquet is a strong choice.
