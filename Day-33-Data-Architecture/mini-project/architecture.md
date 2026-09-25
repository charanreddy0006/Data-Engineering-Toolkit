# Mini Project Architecture

```text
Vehicle / Dealer / Service / Warranty
                 ↓
        Batch + Streaming Ingestion
                 ↓
              Raw Lake
                 ↓
         Quality + Processing
                 ↓
            Lakehouse
            /                  ↓         ↓
       Warehouse   Feature Store
           ↓         ↓
          BI          ML
                 ↓
             Applications
```
