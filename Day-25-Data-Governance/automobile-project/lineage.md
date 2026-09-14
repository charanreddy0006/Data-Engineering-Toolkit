# Automotive Lineage

```text
ECU Signal
   |
   v
Telematics Gateway
   |
   v
Kafka vehicle.events
   |
   v
Bronze vehicle_events
   |
   +--> validation
   |      |
   |      +--> invalid quarantine
   |
   v
Silver vehicle_telemetry
   |
   +--> Certified Telemetry Data Product
   |        |
   |        +--> Engineering
   |        +--> Fleet Analytics
   |        +--> Approved ML
   |
   +--> EV Battery Product
            |
            +--> Battery Analytics
```

## Impact Analysis Example

If `vehicle_id` changes:

1. Find downstream column consumers.
2. Identify dashboards, models, APIs, and products.
3. Notify owners.
4. Validate migration.
5. Test compatibility.
6. Update catalog and contract.
7. Release with evidence.
