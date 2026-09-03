import pandas as pd

telemetry = [
    {"vehicle_id": "VH1001", "speed_kmh": 72, "battery_soc": 81.5},
    {"vehicle_id": "VH1002", "speed_kmh": 55, "battery_soc": 67.2},
    {"vehicle_id": "VH1003", "speed_kmh": 91, "battery_soc": 49.8},
]

df = pd.DataFrame(telemetry)

df["speed_mps"] = df["speed_kmh"] / 3.6
df["low_battery"] = df["battery_soc"] < 50

print("Automotive telemetry from a Dockerized Python job")
print(df.to_string(index=False))
print(f"Average speed: {df['speed_kmh'].mean():.2f} km/h")
print(f"Low-battery vehicles: {df['low_battery'].sum()}")
