# File Format Comparison Matrix

| Format | Human readable | Nested | Schema | Columnar | Streaming-friendly | Typical use |
|---|---:|---:|---:|---:|---:|---|
| CSV | Yes | Poor | Weak | No | Moderate | flat exchange |
| JSON | Yes | Strong | External/optional | No | Moderate | APIs |
| JSONL | Yes | Strong | External/optional | No | Strong | events |
| XML | Yes | Strong | Strong ecosystem | No | Moderate | enterprise |
| YAML | Yes | Strong | Configuration-oriented | No | No | config |
| Avro | No | Yes | Strong | No | Strong | serialization |
| Parquet | No | Yes | Strong | Yes | Dataset-oriented | analytics |
| ORC | No | Yes | Strong | Yes | Dataset-oriented | analytics/Hive |
| XLSX | Yes | Limited | Weak | No | No | business spreadsheets |

The best format depends on workload and ecosystem.
