from datetime import date
from typing import Iterable

TRIP_DISTANCES = [42.5, 61.2, 35.7, 88.4]

def average_distance(distances: Iterable[float]) -> float:
    values = list(distances)
    if not values:
        return 0.0
    return sum(values) / len(values)

def vehicle_feature_record(vehicle_id: str, distances: Iterable[float]) -> dict:
    values = list(distances)
    return {
        "vehicle_id": vehicle_id,
        "feature_date": date.today().isoformat(),
        "trip_count": len(values),
        "distance_km_7d": round(sum(values), 2),
        "average_trip_distance_km_7d": round(average_distance(values), 2),
    }

if __name__ == "__main__":
    print(vehicle_feature_record("V1001", TRIP_DISTANCES))
