# File Formats Interview — Beginner

### What is a file format?

A representation defining how data is encoded and interpreted.

### Why is CSV weakly typed?

CSV primarily represents text fields; types generally have to be inferred or imposed externally.

### What is JSONL?

One JSON object/value per line, useful for incremental processing.

### What is Parquet?

A column-oriented analytical file format.

### What is ORC?

A columnar analytical format strongly associated with the Hadoop/Hive ecosystem.

### What is Avro?

A schema-driven serialization format.

### Why compress?

To reduce storage and I/O at the cost of CPU.

### Why partition?

To organize datasets so engines can potentially skip irrelevant data.

### What is the small-file problem?

Excessive tiny files create metadata, planning, scheduling, and object-store overhead.
