def process_vehicle_stream(events):
    valid = events.filter(lambda e: e["vehicle_id"] is not None)
    keyed = valid.key_by(lambda e: e["vehicle_id"])
    windowed = keyed.window(size="5m", time="event-time")
    return windowed.aggregate("fault_count")
