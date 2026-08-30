from kafka import KafkaProducer
import json

producer = KafkaProducer(
    bootstrap_servers=["localhost:9092"],
    key_serializer=lambda key: key.encode("utf-8"),
    value_serializer=lambda value: json.dumps(value).encode("utf-8"),
)

event = {
    "vehicle_id": "V001",
    "speed": 72,
    "engine_temperature": 91.2,
}

future = producer.send(
    "vehicle.telemetry",
    key="V001",
    value=event,
)

metadata = future.get(timeout=10)
print("topic:", metadata.topic)
print("partition:", metadata.partition)
print("offset:", metadata.offset)

producer.flush()
producer.close()
