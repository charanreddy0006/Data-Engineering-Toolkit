# Automobile Telemetry Quality 🚗

Typical telemetry:

```text
event_id
vehicle_id
event_time
ingestion_time
latitude
longitude
speed_kmh
battery_soc
odometer_km
engine_temperature_c
diagnostic_code
```

Core rules:

| Field | Rule |
|---|---|
| event_id | required + unique |
| vehicle_id | required + master reference |
| event_time | required + sane |
| speed_kmh | 0..350 |
| battery_soc | 0..100 for EV |
| odometer_km | non-negative |
| latitude | -90..90 |
| longitude | -180..180 |

Business rules:

- retired vehicles should not produce new live events
- odometer should generally not decrease
- EV SOC applies according to powertrain/event type
- future event times should be investigated

```text
Vehicle -> Telematics -> Kafka/API -> Quality Gate
                                      /       \
                                   valid     invalid
                                     |          |
                                  Lakehouse   Quarantine
```
