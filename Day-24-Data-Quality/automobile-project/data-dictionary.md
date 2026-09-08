# Automobile Data Dictionary

| Field | Meaning | Quality |
|---|---|---|
| event_id | Unique telemetry event | required, unique |
| vehicle_id | Vehicle identifier | required, reference |
| event_time | Event production time | required, sane |
| ingestion_time | Platform receipt time | required |
| speed_kmh | Vehicle speed | 0..350 |
| battery_soc | EV state of charge | 0..100 |
| odometer_km | Distance reading | >=0 |
| latitude | Latitude | -90..90 |
| longitude | Longitude | -180..180 |

Document units, timezone, nullability, and semantic definitions.
