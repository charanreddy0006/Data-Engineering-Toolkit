def normalize(event):
    return {
        "event_id": str(event["event_id"]).strip(),
        "vehicle_id": str(event["vehicle_id"]).strip(),
        "speed_kph": float(event["speed_kph"]),
    }


def main():
    print(normalize({
        "event_id": " evt-1 ",
        "vehicle_id": " VH-1 ",
        "speed_kph": "55.2",
    }))


if __name__ == "__main__":
    main()
