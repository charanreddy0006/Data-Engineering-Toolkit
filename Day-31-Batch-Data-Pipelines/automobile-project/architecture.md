# Automobile Batch Architecture

```text
Dealer Sales ───────┐
Service Orders ─────┤
Warranty Claims ────┤
Vehicle Master ─────┼→ Batch Ingestion
EV Charging ────────┤        ↓
Manufacturing ──────┘     Staging
                            ↓
                       Data Quality
                            ↓
                    Incremental Transform
                            ↓
                    Curated Data Products
                   /      |       |       \
                Sales  Service Warranty    EV
                   \      |       |       /
                         Warehouse
                         /       \
                        BI       ML
```
