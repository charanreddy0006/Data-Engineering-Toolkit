# Pseudocode for a streaming feature.
# The exact implementation depends on the stream processor and state store.

from collections import defaultdict, deque

events = defaultdict(lambda: deque())

def process_event(event: dict):
    vehicle_id = event["vehicle_id"]
    timestamp = event["event_time"]
    events[vehicle_id].append(event)

    # Keep only the last hour of relevant events.
    # Production code should handle out-of-order events and watermarks.
    threshold = timestamp - 3600
    while events[vehicle_id] and events[vehicle_id][0]["event_time"] < threshold:
        events[vehicle_id].popleft()

    harsh_braking_count_1h = sum(
        1 for e in events[vehicle_id]
        if e.get("harsh_braking") is True
    )

    return {
        "vehicle_id": vehicle_id,
        "harsh_braking_count_1h": harsh_braking_count_1h,
        "feature_timestamp": timestamp,
    }
