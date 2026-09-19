def validate_feature(row: dict) -> list[str]:
    errors = []

    if not row.get("vehicle_id"):
        errors.append("vehicle_id is required")

    if row.get("distance_km_30d", 0) < 0:
        errors.append("distance cannot be negative")

    if not 0 <= row.get("battery_soc", 0) <= 100:
        errors.append("battery_soc must be between 0 and 100")

    if row.get("service_count_90d", 0) < 0:
        errors.append("service_count cannot be negative")

    return errors

sample = {
    "vehicle_id": "V1001",
    "distance_km_30d": 980.2,
    "battery_soc": 72,
    "service_count_90d": 1,
}

print(validate_feature(sample))
