def deduplicate(events):
    seen = set()
    output = []
    for event in events:
        if event["event_id"] in seen:
            continue
        seen.add(event["event_id"])
        output.append(event)
    return output

events = [
    {"event_id":"E1","vehicle_id":"V1"},
    {"event_id":"E1","vehicle_id":"V1"},
    {"event_id":"E2","vehicle_id":"V2"},
]
print(deduplicate(events))
