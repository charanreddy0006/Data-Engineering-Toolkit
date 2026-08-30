from kafka import KafkaConsumer
import json

consumer = KafkaConsumer(
    "vehicle.telemetry",
    bootstrap_servers=["localhost:9092"],
    group_id="vehicle-analytics",
    auto_offset_reset="earliest",
    value_deserializer=lambda value: json.loads(value.decode("utf-8")),
)

try:
    for message in consumer:
        print({
            "partition": message.partition,
            "offset": message.offset,
            "key": message.key,
            "value": message.value,
        })
finally:
    consumer.close()
