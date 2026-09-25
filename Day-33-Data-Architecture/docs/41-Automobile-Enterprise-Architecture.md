# 41. Automobile Enterprise Data Architecture 🚗

## Domains
```text
Vehicle
Sales
Service
Warranty
Manufacturing
Parts
Charging
Fleet
Customer
```

## Reference
```text
Vehicles ────────┐
Dealer Systems ──┤
Service ─────────┤
Warranty ────────┼→ Ingestion
Charging ────────┤      ↓
Manufacturing ───┘   Raw Lake
                         ↓
                 Quality + Processing
                         ↓
                     Lakehouse
                    /                             ↓            ↓
               Warehouse    Feature Store
                   ↓            ↓
                  BI            ML
```

## Consumers
Executives, dealers, fleet operations, service teams, analysts and applications.
