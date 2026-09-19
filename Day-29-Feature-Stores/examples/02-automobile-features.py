from dataclasses import dataclass

@dataclass
class VehicleSignals:
    vehicle_id: str
    distance_km_30d: float
    service_count_90d: int
    fault_count_24h: int
    battery_soc: float

def build_features(s: VehicleSignals) -> dict:
    return {
        "vehicle_id": s.vehicle_id,
        "distance_km_30d": max(s.distance_km_30d, 0),
        "service_count_90d": max(s.service_count_90d, 0),
        "fault_count_24h": max(s.fault_count_24h, 0),
        "battery_soc": min(max(s.battery_soc, 0), 100),
    }

if __name__ == "__main__":
    signals = VehicleSignals("V1001", 1250.4, 2, 5, 61.0)
    print(build_features(signals))
