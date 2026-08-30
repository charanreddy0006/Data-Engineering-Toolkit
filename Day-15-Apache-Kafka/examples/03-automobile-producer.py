from kafka import KafkaProducer
import json
import random
import time

producer = KafkaProducer(
    bootstrap_servers=["localhost:9092"],
    key_serializer=lambda key: key.encode("utf-8"),
    value_serializer=lambda value: json.dumps(value).encode("utf-8"),
)

for i in range(20):
    vehicle_id = f"V{(i % 5) + 1:03d}"

    event = {
        "vehicle_id": vehicle_id,
        "timestamp": time.time(),
        "speed": random.randint(0, 120),
        "engine_temperature": round(random.uniform(75, 105), 2),
        "fuel_level": random.randint(10, 100),
    }

    producer.send(
        "vehicle.telemetry",
        key=vehicle_id,
        value=event,
    )

    print("Produced:", event)
    time.sleep(0.25)

producer.flush()
producer.close()
