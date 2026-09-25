# 23. Azure Architecture

A common pattern:

```text
Sources
 ↓
Event Hubs / Data Factory
 ↓
ADLS
 ↓
Databricks / Synapse
 ↓
Power BI
```

Supporting services:
- Microsoft Entra ID
- Key Vault
- Azure Monitor

## Automobile
Service data can move through scheduled ingestion while vehicle events use Event Hubs for low-latency processing.
